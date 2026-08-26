import {
  to = github_repository.platform-team-administration
  id = "platform-team-administration"
}

resource "github_repository" "platform-team-administration" {
  name = "platform-team-administration"
  description = "Repository to manager platform team membership and admin artifacts"

  visibility = "public"
}
