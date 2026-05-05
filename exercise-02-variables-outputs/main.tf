terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region = "eu-west-2"
  
}

# Create VPC
resource "aws_vpc" "vpc-exer1a" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-exer1a"
  
  }
}

#Create Gateway
resource "aws_internet_gateway" "ig-exer1a" {
  vpc_id = aws_vpc.vpc-exer1a.id

  tags = {
    Name = "ig-exer1a"
  }    
}

# Create Subnet
resource "aws_subnet" "subnet-public-exer1a" {
  vpc_id = aws_vpc.vpc-exer1a.id
  cidr_block = "10.0.1.0/24"
  #map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public-exer1a"
  }
}

# Create Route Table
resource "aws_route_table" "rt-exer1a" {
  vpc_id = aws_vpc.vpc-exer1a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-exer1a.id
  }

  tags = {
    Name = "rt-exer1a"
  }
}

# Create Route Association between Subnet & Route Table
resource "aws_route_table_association" "rt-assoc-exer1a" {
  subnet_id = aws_subnet.subnet-public-exer1a.id
  route_table_id = aws_route_table.rt-exer1a.id  
}


# Create Security Group
resource "aws_security_group" "sgrp-exer1a" {
  name = "sgrp-exer1a"
  description = "Security Group for Exercise 1a"
  vpc_id = aws_vpc.vpc-exer1a.id

  # SSH
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTP
  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


 
  tags = {
    Name = "sg-exer1a"
  }
}


# Create EC2 Instance -> Ubuntu, t3.micro
resource "aws_instance" "server-ubuntu-exer1a" {
  ami = "ami-0951a43515d1f167b"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.subnet-public-exer1a.id # ???? not sure
  vpc_security_group_ids = [aws_security_group.sgrp-exer1a.id]
  key_name = aws_key_pair.key_exer1a.key_name
  associate_public_ip_address = true
  
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx
  sudo systemctl enable nginx
  sudo systemctl start nginx

  echo "<h1>Jano Deployed via Terraform - Exercise 1a</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "server-ubuntu-exer1a"
  }
}  

