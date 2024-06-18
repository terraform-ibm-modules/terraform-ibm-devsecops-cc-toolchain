variable "toolchain_id" {
  type        = string
  description = "The toolchain ID."
  default     = ""
}

variable "pipeline_id" {
  type        = string
  description = "The pipeline ID."
  default     = ""
}

variable "git_token_secret_ref" {
  type        = string
  description = "The secret ref to the Secrets Manager secret for the Git Token. This is the top level setting can be overridden with a local setting from `repository_data`."
  default     = ""
}

variable "repository_owner" {
  type        = string
  description = "The name of the repository owner. This is the top level setting can be overridden with a local setting from `repository_data`."
  default     = ""
}

variable "default_branch" {
  type        = string
  description = "The default branch for the repositories. This is the top level setting can be overridden with a local setting from `repository_data`."
  default     = ""
}

variable "mode" {
  type        = string
  description = "The default operation for creating a repository integration. `clone` will clone the specifed repository. `link` will link to it."
  default     = ""
}

variable "worker_id" {
  type        = string
  description = "The ID of the worker used by the specified trigger. Defaults to `public` for the Managed Worker."
  default     = ""
}

variable "create_default" {
  type        = bool
  description = "Set to `true` to allow creation of default triggers."
  default     = true
}

variable "repository_data" {
}

variable "config_data" {
}
