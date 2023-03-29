variable "pipeline_id" {
}

variable "vault_secret_id_secret_name" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "pipeline_repo_url" {
}

variable "pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v9"
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "external_properties_repo_url" {
}

variable "external_properties_branch" {
  type        = string
  description = "The branch within the repository that contains the definition of the external properties."
  default     = "master"
}

variable "external_properties_path" {
  type        = string
  description = "The relative folder path within the repository containing the definition of the external properties."
  default     = "tekton"
}
