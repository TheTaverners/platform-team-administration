import {
  to = github_repository.platform-team-administration
  id = "platform-team-administration"
}

resource "github_repository" "platform-team-administration" {
  name = "platform-team-administration"
  description = "Repository to manage platform team membership and admin artifacts"

  visibility = "public"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "platform-core" {
  name = "platform-core"
  description = "Core platform runtime"

  visibility = "public"

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "platform-demo-apps" {
  name = "platform-demo-apps"
  description = "Demo applications to test the platform"

  visibility = "public"

  lifecycle {
    prevent_destroy = true
  }
}
