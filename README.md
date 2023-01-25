# Github Environments

## What does this do?

This module creates github environments, adds approvals and defines which branch can be deployed via deployment protection.

## How to use this module?

```hcl
module "github_environments" {
  source = "github.com/dapperlabs-platform/terraform-github-environments?ref=<release>"

  repos = [
    {
      repo_name    = "app-repo"
      environments = "prod"
      reviewers = {
        users = []
        teams = ["sre"]
      }
      protected_branches     = true
      custom_branch_policies = false
      patterns               = "prod"
    },
    {
      repo_name    = "api-repo"
      environments = "prod"
      reviewers = {
        users = []
        teams = ["sre"]
      }
      protected_branches     = true
      custom_branch_policies = false
      patterns               = "prod"
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_github"></a> [github](#requirement\_github) | = 5.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | = 5.8.0 |

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.deploy_protection](https://registry.terraform.io/providers/integrations/github/5.8.0/docs/resources/branch_protection) | resource |
| [github_repository_environment.environments](https://registry.terraform.io/providers/integrations/github/5.8.0/docs/resources/repository_environment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repos"></a> [repos](#input\_repos) | n/a | <pre>list(object({<br>    repo_name              = string<br>    environments           = string<br>    reviewers              = map(list(string))<br>    protected_branches     = bool<br>    custom_branch_policies = bool<br>    patterns               = string<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.