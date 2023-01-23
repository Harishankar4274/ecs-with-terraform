terraform {
	cloud {
		organization = var.organization
		workspaces {
			name = var.workspaces_name
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
  profile = var.aws_profile
}