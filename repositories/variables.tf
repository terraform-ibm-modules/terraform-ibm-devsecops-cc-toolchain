variable "app_repo_existing_url" {
}

variable "app_repo_existing_git_provider" {
}

variable "app_repo_branch" {
}

variable "app_repo_existing_git_id" {
}

variable "inventory_repo_auth_type" {
}

variable "issues_repo_auth_type" {
}

variable "evidence_repo_auth_type" {
}

variable "pipeline_config_repo_auth_type"{
}

variable "app_repo_auth_type"{
}

variable "compliance_pipeline_repo_auth_type"{
}

variable "inventory_repo_git_token_secret_name" {
}

variable "issues_repo_git_token_secret_name" {
}

variable "evidence_repo_git_token_secret_name" {
}

variable "pipeline_config_repo_git_token_secret_name" {
}

variable "app_repo_git_token_secret_name" {
}

variable "compliance_pipeline_repo_git_token_secret_name" {
}

variable "issues_group" {
}

variable "inventory_group" {
}

variable "evidence_group" {
}

variable "pipeline_config_group" {
}

variable "app_group" {
}

variable "compliance_pipeline_group" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_branch" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "inventory_repo_url" {
}

variable "evidence_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "issues_repo_url" {
}

variable "toolchain_id" {
}

variable "toolchain_region" {
}

variable "toolchain_crn" {
    type        = string
    description = "The CRN of the created toolchain"
}

variable "repositories_prefix" { 
}