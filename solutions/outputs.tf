##############################################################################
# Outputs
##############################################################################


output "toolchain_id" {
  value       = module.devsecops_cc_toolchain.toolchain_id
  description = "The CC toolchain ID."
}

output "secrets_manager_instance_id" {
  value       = module.devsecops_cc_toolchain.secrets_manager_instance_id
  description = "The Secrets Manager instance ID."
}

output "key_protect_instance_id" {
  value       = module.devsecops_cc_toolchain.key_protect_instance_id
  description = "The Key Protect instance ID."
}

output "cc_pipeline_id" {
  value       = module.devsecops_cc_toolchain.cc_pipeline_id
  description = "The CC pipeline ID."
}

output "inventory_repo_url" {
  value       = module.devsecops_cc_toolchain.inventory_repo_url
  description = "The inventory repository instance URL, with details of which artifact has been built and will be deployed."
}

output "evidence_repo_url" {
  value       = module.devsecops_cc_toolchain.evidence_repo_url
  description = "The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit."
}

output "issues_repo_url" {
  value       = module.devsecops_cc_toolchain.issues_repo_url
  description = "The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected."
}

output "inventory_repo" {
  value       = module.devsecops_cc_toolchain.inventory_repo
  description = "The Inventory repo."
  sensitive   = true
}

output "evidence_repo" {
  value       = module.devsecops_cc_toolchain.evidence_repo
  description = "The Evidence repo."
  sensitive   = true
}

output "issues_repo" {
  value       = module.devsecops_cc_toolchain.issues_repo
  description = "The Issues repo."
  sensitive   = true
}

output "app_repo_url" {
  value       = module.devsecops_cc_toolchain.app_repo_url
  description = "The app repository instance URL containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "app_repo" {
  value       = module.devsecops_cc_toolchain.app_repo
  description = "The Application repo."
  sensitive   = true
}

output "pipeline_repo_url" {
  value       = module.devsecops_cc_toolchain.pipeline_repo_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "toolchain_url" {
  value       = module.devsecops_cc_toolchain.toolchain_url
  description = "The CC toolchain URL."
}

##############################################################################
