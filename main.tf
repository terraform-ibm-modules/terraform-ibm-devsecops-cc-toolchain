locals {

  is_staging = length(regexall("^crn:v1:staging:.*$", ibm_cd_toolchain.toolchain_instance.crn)) > 0
  git_dev    = "https://dev.us-south.git.test.cloud.ibm.com"
  git_mon01  = "https://mon01.git.cloud.ibm.com"
  git_fr2    = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev
    : (var.toolchain_region == "eu-fr2") ? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )
  # in dev/staging, compliance_pipelines_git_server is dev and clone_from_git_server is mon01
  clone_from_git_server = (
    (local.is_staging) ? local.git_mon01 : local.compliance_pipelines_git_server
  )
  pipeline_config_repo_branch = (
    (var.pipeline_config_repo_branch != "") ?
    var.pipeline_config_repo_branch : "master"
  )

  compliance_repo_url = (var.compliance_pipeline_repo_url != "") ? var.compliance_pipeline_repo_url : format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)

  #Secrets
  app_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.app_repo_secret_group == "") ? format("{vault::%s.${var.app_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.app_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.app_repo_secret_group))
  )

  issues_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.issues_repo_secret_group == "") ? format("{vault::%s.${var.issues_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.issues_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.issues_repo_secret_group))
  )

  evidence_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.evidence_repo_secret_group == "") ? format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.evidence_repo_secret_group))
  )

  inventory_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.inventory_repo_secret_group == "") ? format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.inventory_repo_secret_group))
  )

  compliance_pipeline_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.compliance_pipeline_repo_secret_group == "") ? format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.compliance_pipeline_repo_secret_group))
  )

  pipeline_config_repo_secret_ref = ((var.enable_key_protect) ? module.integrations.secret_tool :
    (var.pipeline_config_repo_secret_group == "") ? format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_config_repo_secret_group))
  )

  cos_secret_ref = (
    (var.enable_key_protect) ? module.integrations.secret_tool :
    (var.cos_api_key_secret_group == "") ? format("{vault::%s.${var.cos_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.cos_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.cos_api_key_secret_group))
  )

  pipeline_apikey_secret_ref = (
    (var.enable_key_protect) ? module.integrations.secret_tool :
    (var.pipeline_ibmcloud_api_key_secret_group == "") ? format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_ibmcloud_api_key_secret_group))
  )

  dockerconfigjson_secret_ref = (
    (var.enable_key_protect) ? module.integrations.secret_tool :
    (var.pipeline_dockerconfigjson_secret_group == "") ? format("{vault::%s.${var.pipeline_dockerconfigjson_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_dockerconfigjson_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_dockerconfigjson_secret_group))
  )

  slack_webhook_secret_ref = (
    (var.enable_key_protect) ? module.integrations.secret_tool :
    (var.slack_webhook_secret_group == "") ? format("{vault::%s.${var.slack_webhook_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.slack_webhook_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.slack_webhook_secret_group))
  )

  artifactory_secret_ref = (
    (var.enable_key_protect) ? module.integrations.secret_tool :
    (var.artifactory_token_secret_group == "") ? format("{vault::%s.${var.artifactory_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.artifactory_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.artifactory_token_secret_group))
  )
}

data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "issues_repo" {
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "issues-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.issues_repo_git_provider
  initilization_type    = var.issues_repo_initilization_type
  repository_url        = var.issues_repo_url
  source_repository_url = ""
  repository_name       = (var.issues_repo_name != "") ? var.issues_repo_name : join("-", [var.repositories_prefix, "issues-repo"])
  is_private_repo       = var.issues_repo_is_private_repo
  owner_id              = var.issues_group
  issues_enabled        = var.issues_repo_issues_enabled
  traceability_enabled  = var.issues_repo_traceability_enabled
  integration_owner     = var.issues_repo_integration_owner
  auth_type             = var.issues_repo_auth_type
  secret_ref            = local.issues_repo_secret_ref
  git_id                = var.issues_repo_git_id
  default_git_provider  = var.default_git_provider
}

module "evidence_repo" {
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "evidence-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.evidence_repo_git_provider
  initilization_type    = var.evidence_repo_initilization_type
  repository_url        = var.evidence_repo_url
  source_repository_url = ""
  repository_name       = (var.evidence_repo_name != "") ? var.evidence_repo_name : join("-", [var.repositories_prefix, "evidence-repo"])
  is_private_repo       = var.evidence_repo_is_private_repo
  owner_id              = var.evidence_group
  issues_enabled        = var.evidence_repo_issues_enabled
  traceability_enabled  = var.evidence_repo_traceability_enabled
  integration_owner     = var.evidence_repo_integration_owner
  auth_type             = var.evidence_repo_auth_type
  secret_ref            = local.evidence_repo_secret_ref
  git_id                = var.evidence_repo_git_id
  default_git_provider  = var.default_git_provider
}

module "inventory_repo" {
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "inventory-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.inventory_repo_git_provider
  initilization_type    = var.inventory_repo_initilization_type
  repository_url        = var.inventory_repo_url
  source_repository_url = ""
  repository_name       = (var.inventory_repo_name != "") ? var.inventory_repo_name : join("-", [var.repositories_prefix, "inventory-repo"])
  is_private_repo       = var.inventory_repo_is_private_repo
  owner_id              = var.inventory_group
  issues_enabled        = var.inventory_repo_issues_enabled
  traceability_enabled  = var.inventory_repo_traceability_enabled
  integration_owner     = var.inventory_repo_integration_owner
  auth_type             = var.inventory_repo_auth_type
  secret_ref            = local.inventory_repo_secret_ref
  git_id                = var.inventory_repo_git_id
  default_git_provider  = var.default_git_provider
}

module "compliance_pipelines_repo" {
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "pipeline-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.compliance_pipeline_repo_git_provider
  initilization_type    = "link"
  repository_url        = local.compliance_repo_url
  source_repository_url = ""
  repository_name       = ""
  is_private_repo       = false
  owner_id              = var.compliance_pipeline_group
  issues_enabled        = var.compliance_pipeline_repo_issues_enabled
  traceability_enabled  = false
  integration_owner     = var.compliance_pipeline_repo_integration_owner
  auth_type             = var.compliance_pipeline_repo_auth_type
  secret_ref            = local.compliance_pipeline_repo_secret_ref
  git_id                = var.compliance_pipelines_repo_git_id
  default_git_provider  = var.default_git_provider
}

module "pipeline_config_repo" {
  count                 = ((var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "")) ? 0 : 1
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "pipeline-config-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.pipeline_config_repo_git_provider
  initilization_type    = var.pipeline_config_repo_initilization_type
  repository_url        = var.pipeline_config_repo_existing_url
  source_repository_url = var.pipeline_config_repo_clone_from_url
  repository_name       = (var.pipeline_config_repo_name != "") ? var.pipeline_config_repo_name : join("-", [var.repositories_prefix, "pipeline-config-repo"])
  is_private_repo       = var.pipeline_config_repo_is_private_repo
  owner_id              = var.pipeline_config_group
  issues_enabled        = var.pipeline_config_repo_issues_enabled
  traceability_enabled  = var.pipeline_config_repo_traceability_enabled
  integration_owner     = var.pipeline_config_repo_integration_owner
  auth_type             = var.pipeline_config_repo_auth_type
  secret_ref            = local.pipeline_config_repo_secret_ref
  git_id                = var.pipeline_config_repo_git_id
  default_git_provider  = var.default_git_provider
}

module "app_repo" {
  source                = "./repos"
  depends_on            = [module.integrations]
  tool_name             = "app-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = (var.app_repo_git_provider != "") ? var.app_repo_git_provider : var.app_repo_clone_to_git_provider
  initilization_type    = var.app_repo_initilization_type
  repository_url        = var.app_repo_url
  source_repository_url = ""
  repository_name       = ""
  is_private_repo       = var.app_repo_is_private_repo
  owner_id              = var.app_group
  issues_enabled        = var.app_repo_issues_enabled
  traceability_enabled  = var.app_repo_traceability_enabled
  integration_owner     = var.app_repo_integration_owner
  auth_type             = var.app_repo_auth_type
  secret_ref            = local.app_repo_secret_ref
  git_id                = (var.app_repo_git_id != "") ? var.app_repo_git_id : var.app_repo_clone_to_git_id
  default_git_provider  = var.default_git_provider
}

resource "ibm_cd_toolchain_tool_pipeline" "cc_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cc-pipeline"
  }
}

module "pipeline_cc" {
  source     = "./pipeline-cc"
  depends_on = [module.app_repo, module.evidence_repo, module.integrations, module.services]

  ibmcloud_api                         = var.ibmcloud_api
  ibmcloud_api_key                     = var.ibmcloud_api_key
  pipeline_id                          = split("/", ibm_cd_toolchain_tool_pipeline.cc_pipeline.id)[1]
  app_repo_url                         = module.app_repo.repository_url
  app_repo                             = module.app_repo.repository
  pipeline_repo_url                    = module.compliance_pipelines_repo.repository_url
  evidence_repo_url                    = module.evidence_repo.repository_url
  inventory_repo_url                   = module.inventory_repo.repository_url
  issues_repo_url                      = module.issues_repo.repository_url
  evidence_repo                        = module.evidence_repo.repository
  inventory_repo                       = module.inventory_repo.repository
  issues_repo                          = module.issues_repo.repository
  pipeline_config_path                 = var.pipeline_config_path
  pipeline_config_repo                 = try(module.pipeline_config_repo[0].repository, "")
  pipeline_branch                      = var.pipeline_branch
  pipeline_config_repo_existing_url    = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url  = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch          = local.pipeline_config_repo_branch
  secret_tool                          = module.integrations.secret_tool
  cos_bucket_name                      = var.cos_bucket_name
  cos_api_key_secret_ref               = local.cos_secret_ref
  cos_endpoint                         = var.cos_endpoint
  compliance_base_image                = var.compliance_base_image
  doi_toolchain_id                     = var.doi_toolchain_id
  doi_environment                      = var.doi_environment
  pipeline_ibmcloud_api_key_secret_ref = local.pipeline_apikey_secret_ref
  pipeline_debug                       = var.pipeline_debug
  opt_in_dynamic_api_scan              = var.opt_in_dynamic_api_scan
  opt_in_dynamic_ui_scan               = var.opt_in_dynamic_ui_scan
  opt_in_dynamic_scan                  = var.opt_in_dynamic_scan
  opt_in_auto_close                    = var.opt_in_auto_close
  sonarqube_config                     = var.sonarqube_config
  slack_notifications                  = var.slack_notifications
  environment_tag                      = var.environment_tag
  enable_pipeline_dockerconfigjson     = var.enable_pipeline_dockerconfigjson
  pipeline_dockerconfigjson_secret_ref = local.dockerconfigjson_secret_ref
  tool_artifactory                     = module.integrations.ibm_cd_toolchain_tool_artifactory
  enable_artifactory                   = var.enable_artifactory
  trigger_timed_name                   = var.trigger_timed_name
  trigger_timed_enable                 = var.trigger_timed_enable
  trigger_timed_cron_schedule          = var.trigger_timed_cron_schedule
  trigger_manual_name                  = var.trigger_manual_name
  trigger_manual_enable                = var.trigger_manual_enable
  trigger_manual_pruner_name           = var.trigger_manual_pruner_name
  trigger_manual_pruner_enable         = var.trigger_manual_pruner_enable
  trigger_timed_pruner_name            = var.trigger_timed_pruner_name
  trigger_timed_pruner_enable          = var.trigger_timed_pruner_enable
  enable_pipeline_notifications        = (var.event_notifications_crn != "" || var.enable_slack) ? true : false
  sonarqube_tool                       = (module.integrations.sonarqube_tool)
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
  slack_webhook_secret_ref      = local.slack_webhook_secret_ref
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
  artifactory_token_secret_ref  = local.artifactory_secret_ref
  sm_integration_name           = var.sm_integration_name
  kp_integration_name           = var.kp_integration_name
  slack_integration_name        = var.slack_integration_name
  event_notifications_tool_name = var.event_notifications_tool_name
  event_notifications_crn       = var.event_notifications_crn
  sonarqube_config              = var.sonarqube_config
  sonarqube_integration_name     = var.sonarqube_integration_name
  sonarqube_user                = var.sonarqube_user
  sonarqube_secret_name         = var.sonarqube_secret_name
  sonarqube_is_blind_connection = var.sonarqube_is_blind_connection
  sonarqube_server_url          = var.sonarqube_server_url
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
