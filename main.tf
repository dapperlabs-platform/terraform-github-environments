locals {
  content   = { for repo in var.repos : repo.repo_name => repo }
  reviewers = flatten([for env in var.repos : env.reviewers])
  patterns  = flatten([for env in var.repos : env.patterns])
}

resource "github_repository_environment" "environments" {
  for_each = local.content

  environment = each.value.environments
  repository  = each.value.repo_name
  dynamic "reviewers" {
    for_each = local.reviewers
    content {
      users = reviewers.value.users
      teams = reviewers.value.teams
    }
  }
  deployment_branch_policy {
    protected_branches     = each.value.protected_branches
    custom_branch_policies = each.value.custom_branch_policies
  }
}

resource "github_branch_protection" "deploy_protection" {
  for_each      = local.content
  repository_id = each.value.repo_name
  pattern       = each.value.patterns
}