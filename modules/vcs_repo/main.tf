resource "github_repository" "terraform_repo" {
  name        = "terraform-repo"
  description = "Terraform repository for managing infrastructure"
}

resource "github_branch_protection" "main" {
  repository_id  = github_repository.terraform_repo.name
  pattern        = "main"
  enforce_admins = false

  required_status_checks {
    strict   = true
    contexts = ["ci/terraform-run"]
  }
}
