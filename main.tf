data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name        = var.toolchain_name
  description = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                          = "./repositories"

  toolchain_id                    = ibm_cd_toolchain.toolchain_instance.id
  toolchain_region                = var.toolchain_region
  deployment_repo                 = var.deployment_repo
  pipeline_repo                   = var.pipeline_repo
  evidence_repo                   = var.evidence_repo
  inventory_repo                  = var.inventory_repo
  issues_repo                     = var.issues_repo
}

resource "ibm_cd_toolchain_tool_pipeline" "cc_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cc-pipeline"
  }
}

module "pipeline-cc" {
  source                    = "./pipeline-cc"
  depends_on                = [ module.repositories, module.integrations, module.services ]

  ibm_cloud_api             = var.ibm_cloud_api
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  pipeline_id               = split("/", ibm_cd_toolchain_tool_pipeline.cc_pipeline.id)[1]
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
  deployment_repo           = module.repositories.deployment_repo_url
  pipeline_repo             = module.repositories.pipeline_repo_url
  evidence_repo             = module.repositories.evidence_repo_url
  inventory_repo            = module.repositories.inventory_repo_url
  issues_repo               = module.repositories.issues_repo_url
  secret_tool               = module.integrations.secret_tool
  cos_bucket_name           = var.cos_bucket_name
  cos_api_key               = var.cos_api_key
  cos_endpoint              = var.cos_endpoint
}

module "integrations" {
  source                    = "./integrations"
  depends_on                = [ module.repositories, module.services ]
  
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  toolchain_id              = ibm_cd_toolchain.toolchain_instance.id
  sm_location               = var.sm_location
  sm_resource_group         = var.sm_resource_group
  sm_name                   = var.sm_name
  sm_instance_guid          = module.services.sm_instance_guid
  sm_secret_group           = var.sm_secret_group
  slack_channel_name        = var.slack_channel_name
  slack_api_token           = var.slack_api_token
  slack_user_name           = var.slack_user_name
  scc_evidence_repo         = module.repositories.evidence_repo_url
  scc_profile               = var.scc_profile
  scc_scope                 = var.scc_scope
}

module "services" {
  source                    = "./services"

  sm_name                   = var.sm_name
  sm_location               = var.sm_location
  sm_resource_group         = var.sm_resource_group
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
}

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "secrets_manager_instance_id" {
  value = module.services.sm_instance_guid
}