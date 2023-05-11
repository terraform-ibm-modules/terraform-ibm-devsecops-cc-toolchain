data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                                         = "./repositories"
  depends_on                                     = [module.integrations]
  toolchain_id                                   = ibm_cd_toolchain.toolchain_instance.id
  toolchain_crn                                  = ibm_cd_toolchain.toolchain_instance.crn
  toolchain_region                               = var.toolchain_region
  default_git_provider                           = var.default_git_provider
  pipeline_config_repo_git_provider              = var.pipeline_config_repo_git_provider
  compliance_pipeline_repo_git_provider          = var.compliance_pipeline_repo_git_provider
  evidence_repo_git_provider                     = var.evidence_repo_git_provider
  inventory_repo_git_provider                    = var.inventory_repo_git_provider
  issues_repo_git_provider                       = var.issues_repo_git_provider
  evidence_repo_url                              = var.evidence_repo_url
  inventory_repo_url                             = var.inventory_repo_url
  issues_repo_url                                = var.issues_repo_url
  app_repo_existing_url                          = var.app_repo_url
  app_repo_existing_git_provider                 = var.app_repo_git_provider
  app_repo_branch                                = var.app_repo_branch
  app_repo_existing_git_id                       = var.app_repo_git_id
  repositories_prefix                            = var.repositories_prefix
  pipeline_config_repo_existing_url              = var.pipeline_config_repo_existing_url
  pipeline_config_repo_branch                    = var.pipeline_config_repo_branch
  pipeline_config_repo_clone_from_url            = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_auth_type                 = var.pipeline_config_repo_auth_type
  pipeline_config_repo_git_token_secret_name     = var.pipeline_config_repo_git_token_secret_name
  evidence_repo_auth_type                        = var.evidence_repo_auth_type
  evidence_repo_git_token_secret_name            = var.evidence_repo_git_token_secret_name
  issues_repo_auth_type                          = var.issues_repo_auth_type
  issues_repo_git_token_secret_name              = var.issues_repo_git_token_secret_name
  inventory_repo_auth_type                       = var.inventory_repo_auth_type
  inventory_repo_git_token_secret_name           = var.inventory_repo_git_token_secret_name
  app_repo_auth_type                             = var.app_repo_auth_type
  app_repo_git_token_secret_name                 = var.app_repo_git_token_secret_name
  compliance_pipeline_repo_url                   = var.compliance_pipeline_repo_url
  compliance_pipeline_repo_auth_type             = var.compliance_pipeline_repo_auth_type
  compliance_pipeline_repo_git_token_secret_name = var.compliance_pipeline_repo_git_token_secret_name
  pipeline_config_group                          = var.pipeline_config_group
  evidence_group                                 = var.evidence_group
  issues_group                                   = var.issues_group
  inventory_group                                = var.inventory_group
  app_group                                      = var.app_group
  compliance_pipeline_group                      = var.compliance_pipeline_group
  secret_tool                                    = module.integrations.secret_tool
}

resource "ibm_cd_toolchain_tool_pipeline" "cc_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cc-pipeline"
  }
}

module "pipeline_cc" {
  source     = "./pipeline-cc"
  depends_on = [module.repositories, module.integrations, module.services]

  ibmcloud_api                          = var.ibmcloud_api
  ibmcloud_api_key                      = var.ibmcloud_api_key
  pipeline_id                           = split("/", ibm_cd_toolchain_tool_pipeline.cc_pipeline.id)[1]
  app_repo_url                          = module.repositories.app_repo_url
  app_repo                              = module.repositories.app_repo
  pipeline_repo_url                     = module.repositories.pipeline_repo_url
  evidence_repo_url                     = module.repositories.evidence_repo_url
  inventory_repo_url                    = module.repositories.inventory_repo_url
  issues_repo_url                       = module.repositories.issues_repo_url
  evidence_repo                         = module.repositories.evidence_repo
  inventory_repo                        = module.repositories.inventory_repo
  issues_repo                           = module.repositories.issues_repo
  pipeline_config_path                  = var.pipeline_config_path
  pipeline_config_repo                  = module.repositories.pipeline_config_repo
  pipeline_branch                       = var.pipeline_branch
  pipeline_config_repo_existing_url     = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url   = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch           = module.repositories.pipeline_config_repo_branch
  secret_tool                           = module.integrations.secret_tool
  cos_bucket_name                       = var.cos_bucket_name
  cos_api_key_secret_name               = var.cos_api_key_secret_name
  cos_endpoint                          = var.cos_endpoint
  compliance_base_image                 = var.compliance_base_image
  doi_toolchain_id                      = var.doi_toolchain_id
  doi_environment                       = var.doi_environment
  pipeline_ibmcloud_api_key_secret_name = var.pipeline_ibmcloud_api_key_secret_name
  pipeline_debug                        = var.pipeline_debug
  opt_in_dynamic_api_scan               = var.opt_in_dynamic_api_scan
  opt_in_dynamic_ui_scan                = var.opt_in_dynamic_ui_scan
  opt_in_dynamic_scan                   = var.opt_in_dynamic_scan
  opt_in_auto_close                     = var.opt_in_auto_close
  sonarqube_config                      = var.sonarqube_config
  slack_notifications                   = var.slack_notifications
  environment_tag                       = var.environment_tag
  enable_pipeline_dockerconfigjson      = var.enable_pipeline_dockerconfigjson
  pipeline_dockerconfigjson_secret_name = var.pipeline_dockerconfigjson_secret_name
  tool_artifactory                      = module.integrations.ibm_cd_toolchain_tool_artifactory
  enable_artifactory                    = var.enable_artifactory
}

module "integrations" {
  source     = "./integrations"
  depends_on = [module.services]

  ibmcloud_api_key              = var.ibmcloud_api_key
  toolchain_id                  = ibm_cd_toolchain.toolchain_instance.id
  sm_location                   = var.sm_location
  sm_resource_group             = var.sm_resource_group
  sm_name                       = var.sm_name
  sm_instance_guid              = module.services.sm_instance_guid
  sm_secret_group               = var.sm_secret_group
  kp_location                   = var.kp_location
  kp_resource_group             = var.kp_resource_group
  kp_name                       = var.kp_name
  kp_instance_guid              = module.services.kp_instance_guid
  enable_secrets_manager        = var.enable_secrets_manager
  enable_key_protect            = var.enable_key_protect
  enable_slack                  = var.enable_slack
  slack_webhook_secret_name     = var.slack_webhook_secret_name
  slack_channel_name            = var.slack_channel_name
  slack_team_name               = var.slack_team_name
  slack_pipeline_fail           = var.slack_pipeline_fail
  slack_pipeline_start          = var.slack_pipeline_start
  slack_pipeline_success        = var.slack_pipeline_success
  slack_toolchain_bind          = var.slack_toolchain_bind
  slack_toolchain_unbind        = var.slack_toolchain_unbind
  scc_evidence_repo             = var.evidence_repo_url
  scc_enable_scc                = var.scc_enable_scc
  scc_integration_name          = var.scc_integration_name
  authorization_policy_creation = var.authorization_policy_creation
  link_to_doi_toolchain         = var.link_to_doi_toolchain
  doi_toolchain_id              = var.doi_toolchain_id
  secret_tool                   = module.integrations.secret_tool
  enable_artifactory            = var.enable_artifactory
  artifactory_dashboard_url     = var.artifactory_dashboard_url
  artifactory_user              = var.artifactory_user
  artifactory_repo_name         = var.artifactory_repo_name
  artifactory_repo_url          = var.artifactory_repo_url
  artifactory_token_secret_name = var.artifactory_token_secret_name
}

module "services" {
  source = "./services"

  sm_name                = var.sm_name
  sm_location            = var.sm_location
  sm_resource_group      = var.sm_resource_group
  kp_name                = var.kp_name
  kp_location            = var.kp_location
  kp_resource_group      = var.kp_resource_group
  enable_secrets_manager = var.enable_secrets_manager
  enable_key_protect     = var.enable_key_protect
}
