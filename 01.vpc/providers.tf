terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "remote-state-sandeep"
    key    = "terraform-ec2-test"
    region = "us-east-1"
    dynamodb_table = "draws26s-prod"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}
