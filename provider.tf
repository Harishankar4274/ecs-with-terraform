terraform {
  cloud {
    organization = "harishankard29"
    workspaces {
      name = "demo-ecs"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # profile = var.aws_profile
}