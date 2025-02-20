terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    bucket = "remote-state-sandeep"
    key    = "terraform-dev-db"
    region = "us-east-1"
    dynamodb_table = "draws26s-prod"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}
