variable "environment" {
    description = "Deployment environment"
    type        = string
    default     = "dev"
}

variable "vpc_cidr" {
    description = "VPC CIDR"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "Public Subnet CIDR"
    type        = string
    default     = "10.0.1.0/24"
}

# variable "private_subnet_cidr" {
#     description = "Private Subnet CIDR"
#     type        = string
#     default     = "10.0.2.0/24"
# }

variable "region" {
    description = "AWS Region"
    type        = string
    default     = "eu-west-2"
}

variable "ubuntu_ami" {
    description = "Server AMI"
    type        = string
    default     = "ami-0951a43515d1f167b" 
}

variable "inst_type" {
    description = "EC2 Instance Type"
    type        = string
    default     = "t3.micro"
}


### SSH Public Key
variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "aws_key"
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/aws_key.pub"
}