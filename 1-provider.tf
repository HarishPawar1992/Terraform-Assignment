provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70"
    }
  }
  /*
  backend "s3" {
    bucket = "terraform-state-eks-tf"
    region = "eu-north-1"
    key    = "vpc/terraform.tfstate"
  }
  */
}
