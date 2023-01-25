variable "repos" {
  type = list(object({
    repo_name              = string
    environments           = string
    reviewers              = map(list(string))
    protected_branches     = bool
    custom_branch_policies = bool
    patterns               = string
  }))
  default = []
}