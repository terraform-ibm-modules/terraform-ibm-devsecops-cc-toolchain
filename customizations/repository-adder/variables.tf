variable "toolchain_id" {
  type        = string
  description = "The ID of the toolchain containing the pipelines and triggers."
  default     = ""
}

variable "pipeline_id" {
  type        = string
  description = "The ID of the pipeline to which properties are attached."
  default     = ""
}

variable "pipeline_repo_data" {
}

variable "config_data" {
}
