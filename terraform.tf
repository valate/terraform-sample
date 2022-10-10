terraform {

  cloud {
    organization = "valete-org"

    workspaces {
      name = "terraform-sample"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 0.14.0"
}
