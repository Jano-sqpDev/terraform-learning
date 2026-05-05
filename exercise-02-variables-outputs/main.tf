# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-${local.name_prefix}"
  
  }
}

#Create Gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ig-${local.name_prefix}"
  }    
}

# Create Subnet
resource "aws_subnet" "subnet-public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  #map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public-${local.name_prefix}"
  }
}

# Create Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "rt-${local.name_prefix}"
  }
}

# Create Route Association between Subnet & Route Table
resource "aws_route_table_association" "rt-assoc" {
  subnet_id = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rt.id  
}


# Create Security Group
resource "aws_security_group" "sgrp" {
  name = "sgrp-${local.name_prefix}"
  description = "Security Group for ${local.long_name}"
  vpc_id = aws_vpc.vpc.id

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
    Name = "sg-${local.name_prefix}"
  }
}


# Create EC2 Instance -> Ubuntu, t3.micro
resource "aws_instance" "server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.inst_type
  subnet_id = aws_subnet.subnet-public.id #
  vpc_security_group_ids = [aws_security_group.sgrp.id]
  key_name = aws_key_pair.aws_key.key_name
  associate_public_ip_address = true
  
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx
  sudo systemctl enable nginx
  sudo systemctl start nginx

  echo "<h1>Jano Deployed via Terraform - Exercise 2</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "server-${local.name_prefix}"
  }
}  

