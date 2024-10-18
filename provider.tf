terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

    backend "s3" {
    bucket         = "daws14-remotestate"
    key            = "eksctl"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "daws14-locking"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}