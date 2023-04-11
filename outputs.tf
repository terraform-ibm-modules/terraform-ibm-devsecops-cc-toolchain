##############################################################################
# Outputs
##############################################################################


output "toolchain_id" {
  value       = ibm_cd_toolchain.toolchain_instance.id
  description = "The CC toolchain ID."
}

output "secrets_manager_instance_id" {
  value       = module.services.sm_instance_guid
  description = "The Secrets Manager instance ID."
}

output "key_protect_instance_id" {
  value       = module.services.kp_instance_guid
  description = "The Key Protect instance ID."
}

output "cc_pipeline_id" {
  value       = module.pipeline_cc.pipeline_id
  description = "The CC pipeline ID."
}

output "pipeline_repo_url" {
  value       = module.repositories.pipeline_repo_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}


##############################################################################
