variable "github_members" {
    type = list(object({
        github_username = string
        github_role = optional(string, "member")
    }))

    default = [
        { github_username = "arnaudmorisset", github_role = "admin" }
    ]
}

resource "github_membership" "membership_for" {
    for_each = { for member in var.github_members : member.github_username => member }

    username = each.value.github_username
    role = each.value.github_role
}
