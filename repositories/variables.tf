variable "deployment_repo" {
    type        = string
    description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
}

variable "pipeline_repo" {
    type        = string
    description = "This repository contains the tekton definitions for compliance pipelines."
}

variable "inventory_repo" {
    type        = string
    description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "evidence_repo" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "issues_repo" {
    type        = string
    description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "toolchain_id" {
}

variable "toolchain_region" {
}