terraform {
  required_version = ">= 0.12.29"
  required_providers {
    aws = {
      version               = "~> 3.40"
      configuration_aliases = [aws.dns]
    }
  }
}

provider "aws" {
  alias = "dns"
}