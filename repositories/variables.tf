variable "deployment_repo_url" {
    type        = string
    description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
}

variable "inventory_repo_auth_type" {
}

variable "issues_repo_auth_type" {
}

variable "evidence_repo_auth_type" {
}

variable "pipeline_config_repo_auth_type"{
}

variable "deployment_repo_auth_type"{
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

variable "deployment_repo_git_token_secret_name" {
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

variable "deployment_group" {
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
    type        = string
    description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "evidence_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "issues_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "toolchain_id" {
}

variable "toolchain_region" {
}

variable "toolchain_crn" {
    type        = string
    description = "The CRN of the created toolchain"
}

variable "deployment_repo_clone_from_url" {
    type        = string
    description = "(Optional) Override the default deployment app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
    default     = ""
}

variable "repositories_prefix" { 
}