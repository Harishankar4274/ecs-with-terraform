variable "aws_region" {
  description = "Add AWS region."
  default = "ap-south-1"
  type = string
}

variable "aws_profile" {
    type = string
    description = "Add your profile configured with AWS CLI to login."
    default = "default"
}

variable "aws_vpc_name" {
    type = string
    description = "Add name for your VPC."
}

variable "aws_vpc_cidr" {
    type = string
    description = "Add CIDR block for your VPC."
    default = "192.168.0.0/16"
}

variable "aws_vpc_azs" {
    type = list(string)
    description = "Add list of AZs available in the region that you want to use. Example ['ap-south-1a', 'ap-south-1b', 'ap-south-1c']"
    default = [ "ap-south-1a" ]
}

variable "aws_vpc_private_subnets" {
    type = list(string)
    description = "Add list of CIDR locks for private subnets in the vpc. Example ['192.168.1.0/24','192.168.2.0/24','192.168.3.0/24']"
    default = [ "192.168.1.0/24" ]
}

variable "aws_vpc_public_subnets" {
    type = list(string)
    description = "Add list of CIDR locks for public subnets in the vpc. Example ['192.168.11.0/24','192.168.12.0/24','192.168.13.0/24']"
    default = [ "192.168.11.0/24" ]
}

variable "enable_nat_gateway" {
    type = bool
    description = "Enable or disable the NAT gateway. Enter a boolean value 'true' or 'false'."
}

variable "environment" {
    type = string
    description = "Add the environment name"
}

variable "organization" {
    type = string
    description = "Terraform Organization Name"
}

variable "workspaces_name" {
    type = string
    description = "Enter the terraform workspace name"
}