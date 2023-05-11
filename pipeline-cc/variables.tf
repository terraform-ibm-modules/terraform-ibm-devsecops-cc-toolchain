variable "pipeline_id" {
}

variable "ibmcloud_api" {
}

variable "ibmcloud_api_key" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "pipeline_ibmcloud_api_key_secret_name" {
}

variable "pipeline_dockerconfigjson_secret_name" {
}

variable "enable_pipeline_dockerconfigjson" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "pipeline_config_repo_branch" {
}

variable "pipeline_config_path" {
}

variable "pipeline_config_repo" {
}

variable "app_repo" {
}

variable "pipeline_repo_url" {
}

variable "inventory_repo" {
}

variable "evidence_repo" {
}

variable "issues_repo" {
}

variable "app_repo_url" {
}

variable "inventory_repo_url" {
}

variable "evidence_repo_url" {
}

variable "issues_repo_url" {
}

variable "pipeline_branch" {
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "cos_api_key_secret_name" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}

variable "compliance_base_image" {
}

variable "doi_environment" {
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOpsInsights Toolchain ID"
  default     = ""
}

variable "pipeline_debug" {
}

variable "opt_in_dynamic_api_scan" {
}

variable "opt_in_dynamic_ui_scan" {
}

variable "opt_in_dynamic_scan" {
}

variable "opt_in_auto_close" {
}

variable "sonarqube_config" {
}

variable "slack_notifications" {
}

variable "environment_tag" {
}

variable "enable_artifactory" {
}

variable "tool_artifactory" {
}
