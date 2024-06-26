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

variable "pipeline_ibmcloud_api_key_secret_ref" {
}

variable "pipeline_doi_api_key_secret_ref" {
}

variable "link_to_doi_toolchain" {
}

variable "pipeline_dockerconfigjson_secret_ref" {
}

variable "pipeline_git_token_secret_ref" {
}

variable "enable_pipeline_dockerconfigjson" {
}

variable "enable_pipeline_git_token" {
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

variable "pipeline_git_tag" {
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "cos_api_key_secret_ref" {
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

variable "sonarqube_tool" {
}

variable "event_notifications" {
}

variable "slack_notifications" {
}

variable "worker_id" {
}

variable "environment_tag" {
}

variable "enable_artifactory" {
}

variable "tool_artifactory" {
}

variable "peer_review_compliance" {
}

variable "trigger_timed_name" {
}
variable "trigger_timed_enable" {
}
variable "trigger_timed_cron_schedule" {
}

variable "trigger_manual_name" {
}
variable "trigger_manual_enable" {
}

variable "trigger_manual_pruner_name" {
}
variable "trigger_manual_pruner_enable" {
}

variable "trigger_timed_pruner_name" {
}
variable "trigger_timed_pruner_enable" {
}

variable "enable_pipeline_notifications" {
}

variable "opt_in_gosec" {
}

variable "gosec_private_repository_host" {
}

variable "gosec_repository_ssh_secret_ref" {
}
variable "cra_bom_generate" {
}
variable "cra_vulnerability_scan" {
}
variable "cra_deploy_analysis" {
}
