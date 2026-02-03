provider "aws" {
  region  = var.aws_region
  profile = "edu"
}

provider "github" {
  token = var.github_token
}

provider "docker" {}

module "vcs_repo" {
  source = "./modules/vcs_repo"
}

resource "aws_instance" "msharkovska-tf-lab" {
  ami           = "ami-055a9df0c8c9f681c"
  instance_type = "t3.micro"
  key_name      = var.key_name

  tags = {
    Name = "msharkovska-tf-lab"
  }
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = "nginx"
  ports {
    internal = 80
    external = 8000
  }
}
