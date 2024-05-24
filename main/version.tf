terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.51.0"
    }
  }
  backend "s3" {
    bucket = "aws-654654413093-statefile"
    key = "nonprod/nonprod.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
  required_version = "> 1.8.0"
}