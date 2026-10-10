variable "github_repositories" {
  type = list(object({
    github_repository_name        = string
    github_repository_description = string
  }))

  default = [
    {
      github_repository_name        = "platform-team-administration"
      github_repository_description = "Repository to manage platform team membership and admin artifacts"
    },
    {
      github_repository_name        = "platform-core"
      github_repository_description = "Core platform runtime"
    },
    {
      github_repository_name        = "platform-demo-apps"
      github_repository_description = "Demo applications to test the platform"
    },
    {
      github_repository_name        = "platform-extensions"
      github_repository_description = ""
    },
    {
      github_repository_name        = "cantrip"
      github_repository_description = "A TTRPG ambiance app. It lets a Game Master control atmosphere (sound, lighting, visuals) during tabletop RPG sessions."
    }
  ]
}

resource "github_repository" "repository_for" {
  for_each = { for repository in var.github_repositories : repository.github_repository_name => repository }

  name        = each.value.github_repository_name
  description = each.value.github_repository_description

  visibility = "public"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "branch_protection_for" {
  for_each = github_repository.repository_for

  repository_id = each.value.node_id

  pattern                = "main"
  enforce_admins         = true
  require_signed_commits = true
}
