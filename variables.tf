variable "project_name" {
  description = "Unique name representing the module, will be used to tag resources created by it."
  type        = string
  default     = "github-oidc-provider"
}

variable "github_organization_name" {
  description = "Organization name on Github."
  type        = string
  nullable    = false
}

variable "github_repository_name" {
  description = "Repository name on Github."
  type        = string
  nullable    = false
}
