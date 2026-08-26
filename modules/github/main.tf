terraform {
  required_version = ">= 1.15.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Authentication is done using the GITHUB_TOKEN env var.
provider "github" {
  owner = "TheTaverners"
}
