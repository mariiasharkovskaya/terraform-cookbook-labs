variable "github_token" {
  description = "GitHub token for VCS tf module"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "AWS EC2 Key Pair"
  type        = string
  default     = "terraform-cookbook-key"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
