variable "repository_integration_id" {
  type        = string
  description = "The tool integration ID for the repository."
  default     = ""
}

variable "pipeline_id" {
  type        = string
  description = "The ID of the target pipeline."
  default     = ""
}

variable "branch" {
  type        = string
  description = "The default branch of the repository."
  default     = ""
}

variable "repository_url" {
  type        = string
  description = "The repository URL."
  default     = ""
}

variable "max_concurrent_runs" {
  type        = number
  description = "The max number of concurrent runs."
  default     = 1
}
