data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source = "./repositories"

  toolchain_id                       = ibm_cd_toolchain.toolchain_instance.id
  toolchain_crn                      = ibm_cd_toolchain.toolchain_instance.crn
  toolchain_region                   = var.toolchain_region
  deployment_repo_url                = var.deployment_repo_url
  evidence_repo_url                  = var.evidence_repo_url
  inventory_repo_url                 = var.inventory_repo_url
  issues_repo_url                    = var.issues_repo_url
  deployment_repo_clone_from_url     = var.deployment_repo_clone_from_url
  repositories_prefix                = var.repositories_prefix
  pipeline_config_repo_existing_url  = var.pipeline_config_repo_existing_url
  pipeline_config_repo_branch        = var.pipeline_config_repo_branch
}

resource "ibm_cd_toolchain_tool_pipeline" "cc_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cc-pipeline"
  }
}

module "pipeline-cc" {
  source     = "./pipeline-cc"
  depends_on = [module.repositories, module.integrations, module.services]

  ibm_cloud_api                         = var.ibm_cloud_api
  ibm_cloud_api_key                     = var.ibm_cloud_api_key
  pipeline_id                           = split("/", ibm_cd_toolchain_tool_pipeline.cc_pipeline.id)[1]
  registry_namespace                    = var.registry_namespace
  registry_region                       = var.registry_region
  deployment_repo_url                   = module.repositories.deployment_repo_url
  deployment_repo                       = module.repositories.deployment_repo
  pipeline_repo_url                     = module.repositories.pipeline_repo_url
  evidence_repo_url                     = module.repositories.evidence_repo_url
  inventory_repo_url                    = module.repositories.inventory_repo_url
  issues_repo_url                       = module.repositories.issues_repo_url
  evidence_repo                         = module.repositories.evidence_repo
  inventory_repo                        = module.repositories.inventory_repo
  issues_repo                           = module.repositories.issues_repo
  pipeline_config_repo                  = module.repositories.pipeline_config_repo
  pipeline_config_path                  = var.pipeline_config_path
  pipeline_config_repo_existing_url     = var.pipeline_config_repo_existing_url
  pipeline_config_repo_branch           = var.pipeline_config_repo_branch
  secret_tool                           = module.integrations.secret_tool
  cos_bucket_name                       = var.cos_bucket_name
  cos_api_key_secret_name               = var.cos_api_key_secret_name
  cos_endpoint                          = var.cos_endpoint
  compliance_base_image                 = var.compliance_base_image
  doi_toolchain_id                      = var.doi_toolchain_id
  doi_environment                       = var.doi_environment
  pipeline_ibmcloud_api_key_secret_name = var.pipeline_ibmcloud_api_key_secret_name
}

module "integrations" {
  source     = "./integrations"
  depends_on = [module.repositories, module.services]

  ibm_cloud_api_key              = var.ibm_cloud_api_key
  toolchain_id                   = ibm_cd_toolchain.toolchain_instance.id
  sm_location                    = var.sm_location
  sm_resource_group              = var.sm_resource_group
  sm_name                        = var.sm_name
  sm_instance_guid               = module.services.sm_instance_guid
  sm_secret_group                = var.sm_secret_group
  kp_location                   = var.kp_location
  kp_resource_group             = var.kp_resource_group
  kp_name                       = var.kp_name
  kp_instance_guid              = module.services.kp_instance_guid
  enable_secrets_manager        = var.enable_secrets_manager
  enable_key_protect            = var.enable_key_protect
  slack_channel_name             = var.slack_channel_name
  slack_api_token                = var.slack_api_token
  slack_user_name                = var.slack_user_name
  scc_evidence_repo              = module.repositories.evidence_repo_url
  scc_profile                    = var.scc_profile
  scc_scope                      = var.scc_scope
  authorization_policy_creation  = var.authorization_policy_creation
  link_to_doi_toolchain          = var.link_to_doi_toolchain
  doi_toolchain_id               = var.doi_toolchain_id
}

module "services" {
  source = "./services"

  sm_name                 = var.sm_name
  sm_location             = var.sm_location
  sm_resource_group       = var.sm_resource_group
  kp_name                 = var.kp_name
  kp_location             = var.kp_location
  kp_resource_group       = var.kp_resource_group
  enable_secrets_manager  = var.enable_secrets_manager
  enable_key_protect      = var.enable_key_protect
  registry_namespace      = var.registry_namespace
  registry_region         = var.registry_region
}

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "secrets_manager_instance_id" {
  value = module.services.sm_instance_guid
}

output "key_protect_instance_id" {
  value = module.services.kp_instance_guid
}

output "cc_pipeline_id" {
  value = module.pipeline-cc.pipeline_id
}

output "pipeline_repo_url" {
  value       = module.repositories.pipeline_repo_url
  description = "This repository url contains the tekton definitions for compliance pipelines"
}
