terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.30"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 6.10.2"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }

}
