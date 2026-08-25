# We must include this block in every child modules to avoid bugs.
# See https://github.com/integrations/terraform-provider-github/issues/876#issuecomment-1303790559
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
    }
  }
}

# Authentication is done using the GITHUB_TOKEN env var.
provider "github" {
  owner = "TheTaverners"
}
