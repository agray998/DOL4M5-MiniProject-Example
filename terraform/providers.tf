terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.4.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.9.1"
    }
  }
  # backend "s3" {
    # bucket                   = "tf-state-0023-6566-1750"
    # region                   = "eu-west-2"
    # key                      = "lab5/state"
    # shared_credentials_files = ["~/.aws/credentials"]
  # }
}

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "eu-west-2"
}
