variable "toolchain_id" {
}

variable "resource_group" {
}

variable "region" {
}

variable "secrets_manager_integration_name" {
  type        = string
  description = "Name of the Secrets Manager Toolchain Integration"
  default     = "SM Integration Instance"
}

variable "secrets_manager_instance_name" {
  type        = string
  description = "Name of the Secrets Manager Toolchain Service Instance in IBM Cloud"
}

variable "secrets_manager_instance_guid" {
  type        = string
  description = "GUID of the Secrets Manager Toolchain Service Instance in IBM Cloud"
}

#variable "key_protect_service_auth" {
#  type        = string
#  description = "Authorization Permission for the Key Protect Toolchain Service Instance in IBM Cloud"
#  default     = "[\"Viewer\", \"ReaderPlus\"]"
#}

variable "secrets_manager_service_auth" {
  type        = string
  description = "Authorization Permission for the Secrets Manager Toolchain Service Instance in IBM Cloud"
  default     = "[\"Viewer\", \"SecretReader\"]"
}

variable "slack_api_token" {
  type        = string
  description = "API Token for Slack Channel"
  default     = ""
}

variable "slack_channel_name" {
  type        = string
  description = "Name of Slack Channel"
  default     = ""
}

variable "slack_user_name" {
  type        = string
  description = "Name of Slack User"
  default     = ""
}

variable "scc_evidence_repo" {
}

variable "scc_profile" {
}

variable "scc_scope" {
}

variable "ibm_cloud_api_key" {
}
