provider "aws" {
  region  = "us-west-2"
  profile = "edu"
}

resource "aws_instance" "msharkovska-example" {
  ami           = "ami-055a9df0c8c9f681c"
  instance_type = "t3.micro"

  tags = {
    Name = "msharkovska-tf"
  }
}

provider "github" {
  token = var.github_token
}

module "vcs_repo" {
  source = "./modules/vcs_repo"
}

resource "github_repository" "sandbox" {
  name        = "terraform-cookbook-sandbox"
  description = "Terraform Cookbook Practice"
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}
