variable "secrets_manager_instance_name" {
  type        = string
  description = "Name of the Secrets Manager Toolchain Service Instance in IBM Cloud"
}

variable "sm_resource_group" {
  type        = string
  description = "Name of the Secrets Manager Toolchain resource group in IBM Cloud"
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