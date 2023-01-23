module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

    name = var.aws_vpc_name
    cidr = var.aws_vpc_cidr

    azs     = var.aws_vpc_azs
    private_subnets = var.aws_vpc_private_subnets
    public_subnets = var.aws_vpc_public_subnets

    enable_nat_gateway = var.enable_nat_gateway

    tags = {
        Name	= var.aws_vpc_name
				Terraform = "true"
				Environment = var.environment
    }
}