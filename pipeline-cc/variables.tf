variable "pipeline_id" {
}

variable "resource_group" {
}

variable "cluster_name" {
}

variable "cluster_namespace" {
}

variable "cluster_region" {
}

variable "registry_namespace" {
}

variable "registry_region" {
}

variable "region" {
}

variable "ibm_cloud_api" {
}

variable "ibm_cloud_api_key" {
}

variable "sm_integration_name" {
}

variable "deployment_repo" {
}

variable "pipeline_repo" {
    type        = string
    description = "The repository url containing pipeline definitions for Compliance CI Toolchain."
}

variable "inventory_repo" {
}

variable "evidence_repo" {
}

variable "issues_repo" {    
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

variable "cc_pipeline_manual_trigger_name" {
  type        = string
  description = "The name of Manual Trigger for CC Pipeline as defined in tekton definition."
  default     = "CC Manual Trigger"
}

variable "cc_pipeline_manual_trigger_type" {
  type        = string
  description = "The type of Manual Trigger for CC Pipeline as defined in tekton definition."
  default     = "manual"
}

variable "cc_pipeline_manual_trigger_disabled" {
  type        = bool
  description = "Flag to disable manual CC Trigger"
  default     = false
}

variable "cc_pipeline_trigger_listener_name" {
  type        = string
  description = "The name of EventListener for the CC Pipeline SCM Trigger as defined in tekton definition."
  default     = "cc-listener"
}

variable "cc_pipeline_timed_trigger_name" {
  type        = string
  description = "The name of timed Pipeline Trigger for CC Pipeline as defined in tekton definition."
  default     = "CC Timed Trigger"
}

variable "cc_pipeline_timed_trigger_type" {
  type        = string
  description = "The type of timed Pipeline Trigger for CC Pipeline as defined in tekton definition."
  default     = "timer"
}

variable "cc_pipeline_timed_trigger_cron" {
  type        = string
  description = "The cron setting of the timed Pipeline Trigger for CC Pipeline as defined in tekton definition."
  default     = "0 4 * * *"
}

variable "cc_pipeline_timed_trigger_disabled" {
  type        = bool
  description = "Flag to disable timed Trigger pipeline"
  default     = false
}

variable "cc_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by CD Pipeline"
  default     = 1
}

variable "sm_group" {
  type        = string
  description = "The default Secrets Manager group for your secrets. "
  default     = "Default"
}

variable "cos_api_key" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}