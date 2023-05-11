variable "toolchain_id" {
}

variable "sm_resource_group" {
}

variable "sm_location" {
}

variable "sm_name" {
}

variable "sm_secret_group" {
}

variable "sm_instance_guid" {
  type        = string
  description = "GUID of the Secrets Manager service Instance in IBM Cloud"
}

variable "kp_resource_group" {
}

variable "kp_location" {
}

variable "kp_name" {
}

variable "enable_key_protect" {
}

variable "enable_secrets_manager" {
}

variable "kp_instance_guid" {
  type        = string
  description = "GUID of the KeyProtect service instance in IBM Cloud"
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

#variable "key_protect_service_auth" {
#  type        = string
#  description = "Authorization Permission for the Key Protect Toolchain Service Instance in IBM Cloud"
#  default     = "[\"Viewer\", \"ReaderPlus\"]"
#}

variable "enable_slack" {
}

variable "slack_webhook_secret_name" {
}

variable "slack_channel_name" {
}

variable "slack_team_name" {
}

variable "slack_pipeline_fail" {
}

variable "slack_pipeline_start" {
}

variable "slack_pipeline_success" {
}

variable "slack_toolchain_bind" {
}

variable "slack_toolchain_unbind" {
}

variable "scc_evidence_repo" {
}

variable "scc_enable_scc" {
}

variable "scc_integration_name" {
}

variable "ibmcloud_api_key" {
}

variable "authorization_policy_creation" {
}

variable "link_to_doi_toolchain" {
}

variable "doi_toolchain_id" {
}

variable "enable_artifactory" {
}

variable "artifactory_dashboard_url" {
}

variable "artifactory_user" {
}

variable "artifactory_token_secret_name" {
}

variable "artifactory_repo_name" {
}

variable "artifactory_repo_url" {
}
