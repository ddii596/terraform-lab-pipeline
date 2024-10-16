terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.72.0"  # Define a versão aqui
    }
  }
}

provider "aws" {
  region = "us-east-1" #Define a região no bloco do provider
}
