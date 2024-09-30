locals {

  is_staging = length(regexall("^crn:v1:staging:.*$", ibm_cd_toolchain.toolchain_instance.crn)) > 0
  git_dev    = "https://dev.us-south.git.test.cloud.ibm.com"
  git_fr2    = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev
    : (var.toolchain_region == "eu-fr2") ? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )

  compliance_repo_url = (var.compliance_pipeline_repo_url != "") ? var.compliance_pipeline_repo_url : format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)

  #Secrets
  app_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.app_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.app_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.app_repo_secret_group == "") ? format("{vault::%s.${var.app_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.app_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.app_repo_secret_group))
  )

  issues_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.issues_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.issues_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.issues_repo_secret_group == "") ? format("{vault::%s.${var.issues_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.issues_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.issues_repo_secret_group))
  )

  evidence_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.evidence_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.evidence_repo_secret_group == "") ? format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.evidence_repo_secret_group))
  )

  inventory_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.inventory_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.inventory_repo_secret_group == "") ? format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.inventory_repo_secret_group))
  )

  compliance_pipeline_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.compliance_pipeline_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.compliance_pipeline_repo_secret_group == "") ? format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.compliance_pipeline_repo_secret_group))
  )

  pipeline_config_repo_secret_ref = (
    (var.sm_instance_crn != "") ? var.pipeline_config_repo_git_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", module.integrations.secret_tool) :
    (var.pipeline_config_repo_secret_group == "") ? format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_config_repo_secret_group))
  )

  cos_secret_ref = (
    (var.sm_instance_crn != "") ? var.cos_api_key_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.cos_api_key_secret_name}}", module.integrations.secret_tool) :
    (var.cos_api_key_secret_group == "") ? format("{vault::%s.${var.cos_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.cos_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.cos_api_key_secret_group))
  )

  pipeline_apikey_secret_ref = (
    (var.sm_instance_crn != "") ? var.pipeline_ibmcloud_api_key_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", module.integrations.secret_tool) :
    (var.pipeline_ibmcloud_api_key_secret_group == "") ? format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_ibmcloud_api_key_secret_group))
  )

  slack_webhook_secret_ref = (
    (var.sm_instance_crn != "") ? var.slack_webhook_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.slack_webhook_secret_name}}", module.integrations.secret_tool) :
    (var.slack_webhook_secret_group == "") ? format("{vault::%s.${var.slack_webhook_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.slack_webhook_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.slack_webhook_secret_group))
  )

  artifactory_secret_ref = (
    (var.sm_instance_crn != "") ? var.artifactory_token_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.artifactory_token_secret_name}}", module.integrations.secret_tool) :
    (var.artifactory_token_secret_group == "") ? format("{vault::%s.${var.artifactory_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.artifactory_token_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.artifactory_token_secret_group))
  )

  scc_scc_api_key_secret_ref = (
    (var.sm_instance_crn != "") ? var.scc_scc_api_key_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.scc_scc_api_key_secret_name}}", module.integrations.secret_tool) :
    (var.scc_scc_api_key_secret_group == "") ? format("{vault::%s.${var.scc_scc_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.scc_scc_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.scc_scc_api_key_secret_group))
  )

  sonarqube_secret_ref = (
    (var.sm_instance_crn != "") ? var.sonarqube_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.sonarqube_secret_name}}", module.integrations.secret_tool) :
    (var.sonarqube_secret_group == "") ? format("{vault::%s.${var.sonarqube_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.sonarqube_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sonarqube_secret_group))
  )

  pipeline_doi_api_key_secret_ref = (
    (var.sm_instance_crn != "") ? var.pipeline_doi_api_key_secret_crn :
    (var.enable_key_protect) ? format("{vault::%s.${var.pipeline_doi_api_key_secret_name}}", module.integrations.secret_tool) :
    (var.pipeline_doi_api_key_secret_group == "") ? format("{vault::%s.${var.pipeline_doi_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.sm_secret_group)) :
    format("{vault::%s.${var.pipeline_doi_api_key_secret_name}}", format("%s.%s", module.integrations.secret_tool, var.pipeline_doi_api_key_secret_group))
  )

  properties_file_input = (var.pipeline_properties_filepath == "") ? try(file("${path.root}/properties.json"), "[]") : try(file(var.pipeline_properties_filepath), "[]")
  properties_file_data  = (local.properties_file_input == "") ? "[]" : local.properties_file_input
  properties_input      = (var.pipeline_properties == "") ? local.properties_file_data : var.pipeline_properties
  pre_process_prop_data = flatten([for pipeline in jsondecode(local.properties_input) : {
    pipeline_id = pipeline.pipeline_id # could be `ci`, `pr` or actual pipeline ID
    properties  = try(pipeline.properties, {})
    }
  ])

  config_data = {
    "default_locked_properties" = var.default_locked_properties,
    "secrets_integration_name"  = var.sm_integration_name,
    "secrets_group"             = var.sm_secret_group,
    "secrets_provider_type" = (
      (var.enable_key_protect) ? "kp" :
      (var.enable_secrets_manager) ? "sm" : ""
    ),
    "cos-api-key"            = var.cos_api_key_secret_name,
    "cos-bucket-name"        = var.cos_bucket_name,
    "cos-endpoint"           = var.cos_endpoint,
    "doi-toolchain-id"       = var.doi_toolchain_id,
    "doi-ibmcloud-api-key"   = (var.pipeline_doi_api_key_secret_name == "") ? var.pipeline_ibmcloud_api_key_secret_name : var.pipeline_doi_api_key_secret_name
    "ibmcloud-api-key"       = var.pipeline_ibmcloud_api_key_secret_name,
    "environment-tag"        = var.environment_tag
    "pipeline-config-branch" = (var.pipeline_config_repo_branch == "") ? var.app_repo_branch : var.pipeline_config_repo_branch
  }

  repos_file_input = (var.repository_properties_filepath == "") ? try(file("${path.root}/repositories.json"), "[]") : try(file(var.repository_properties_filepath), "[]")
  repos_file_data  = (local.repos_file_input == "") ? "[]" : local.repos_file_input
  repos_input      = (var.repository_properties == "") ? local.repos_file_data : var.repository_properties
  pre_process_repo_data = flatten([for pipeline in jsondecode(local.repos_input) : {
    pipeline_id          = pipeline.pipeline_id # could be `ci`, `pr` or actual pipeline ID
    git_token_secret_ref = try(pipeline.git_token_secret_ref, "")
    repository_owner     = try(pipeline.repository_owner, "")
    repositories         = try(pipeline.repositories, [])
    mode                 = try(pipeline.mode, "link")
    worker_id            = try(pipeline.worker_id, "public")
    default_branch       = try(pipeline.default_branch, "master")
    provider             = try(pipeline.provider, "")
    git_id               = try(pipeline.git_id, "")
    }
  ])
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
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "issues-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.issues_repo_git_provider
  initialization_type   = var.issues_repo_initialization_type
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
  blind_connection      = var.issues_repo_blind_connection
  title                 = var.issues_repo_title
  root_url              = var.issues_repo_root_url
}

module "evidence_repo" {
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "evidence-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.evidence_repo_git_provider
  initialization_type   = var.evidence_repo_initialization_type
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
  blind_connection      = var.evidence_repo_blind_connection
  title                 = var.evidence_repo_title
  root_url              = var.evidence_repo_root_url
  default_git_provider  = var.default_git_provider
}

module "inventory_repo" {
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "inventory-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.inventory_repo_git_provider
  initialization_type   = var.inventory_repo_initialization_type
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
  blind_connection      = var.inventory_repo_blind_connection
  title                 = var.inventory_repo_title
  root_url              = var.inventory_repo_root_url
  default_git_provider  = var.default_git_provider
}

module "compliance_pipelines_repo" {
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "pipeline-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.compliance_pipeline_repo_git_provider
  initialization_type   = var.compliance_pipelines_repo_initialization_type
  repository_url        = (var.compliance_pipeline_existing_repo_url == "") ? local.compliance_repo_url : var.compliance_pipeline_existing_repo_url
  source_repository_url = var.compliance_pipeline_source_repo_url
  repository_name       = var.compliance_pipelines_repo_name
  is_private_repo       = var.compliance_pipelines_repo_is_private_repo
  owner_id              = var.compliance_pipeline_group
  issues_enabled        = var.compliance_pipeline_repo_issues_enabled
  traceability_enabled  = var.compliance_pipelines_repo_traceability_enabled
  integration_owner     = var.compliance_pipeline_repo_integration_owner
  auth_type             = var.compliance_pipeline_repo_auth_type
  secret_ref            = local.compliance_pipeline_repo_secret_ref
  git_id                = var.compliance_pipelines_repo_git_id
  blind_connection      = var.compliance_pipelines_repo_blind_connection
  title                 = var.compliance_pipelines_repo_title
  root_url              = var.compliance_pipelines_repo_root_url
  default_git_provider  = var.default_git_provider
}

module "pipeline_config_repo" {
  count                 = ((var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "")) ? 0 : 1
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "pipeline-config-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = var.pipeline_config_repo_git_provider
  initialization_type   = var.pipeline_config_repo_initialization_type
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
  blind_connection      = var.pipeline_config_repo_blind_connection
  title                 = var.pipeline_config_repo_title
  root_url              = var.pipeline_config_repo_root_url
  default_git_provider  = var.default_git_provider
}

module "app_repo" {
  source                = "./customizations/repositories"
  depends_on            = [module.integrations]
  tool_name             = "app-repo"
  toolchain_id          = ibm_cd_toolchain.toolchain_instance.id
  git_provider          = (var.app_repo_git_provider != "") ? var.app_repo_git_provider : var.app_repo_clone_to_git_provider
  initialization_type   = var.app_repo_initialization_type
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
  blind_connection      = var.app_repo_blind_connection
  title                 = var.app_repo_title
  root_url              = var.app_repo_root_url
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

  ibmcloud_api_key                    = var.ibmcloud_api_key
  pipeline_id                         = split("/", ibm_cd_toolchain_tool_pipeline.cc_pipeline.id)[1]
  app_repo_url                        = module.app_repo.repository_url
  app_repo                            = module.app_repo.repository
  pipeline_repo_url                   = module.compliance_pipelines_repo.repository_url
  evidence_repo_url                   = module.evidence_repo.repository_url
  inventory_repo_url                  = module.inventory_repo.repository_url
  issues_repo_url                     = module.issues_repo.repository_url
  evidence_repo                       = module.evidence_repo.repository
  inventory_repo                      = module.inventory_repo.repository
  issues_repo                         = module.issues_repo.repository
  pipeline_config_repo                = try(module.pipeline_config_repo[0].repository, "")
  pipeline_branch                     = var.pipeline_branch
  pipeline_git_tag                    = var.pipeline_git_tag
  pipeline_config_repo_existing_url   = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url = var.pipeline_config_repo_clone_from_url
  secret_tool                         = module.integrations.secret_tool
  worker_id                           = var.worker_id
  tool_artifactory                    = module.integrations.ibm_cd_toolchain_tool_artifactory
  enable_artifactory                  = var.enable_artifactory
  enable_pipeline_git_token           = var.enable_pipeline_git_token
  create_triggers                     = var.create_triggers
  trigger_timed_name                  = var.trigger_timed_name
  trigger_timed_enable                = var.trigger_timed_enable
  trigger_timed_cron_schedule         = var.trigger_timed_cron_schedule
  trigger_manual_name                 = var.trigger_manual_name
  trigger_manual_enable               = var.trigger_manual_enable
  trigger_manual_pruner_name          = var.trigger_manual_pruner_name
  trigger_manual_pruner_enable        = var.trigger_manual_pruner_enable
  trigger_timed_pruner_name           = var.trigger_timed_pruner_name
  trigger_timed_pruner_enable         = var.trigger_timed_pruner_enable
  enable_pipeline_notifications       = var.enable_pipeline_notifications
  sonarqube_tool                      = (module.integrations.sonarqube_tool)
  sonarqube_user                      = var.sonarqube_user
  link_to_doi_toolchain               = var.link_to_doi_toolchain
  add_pipeline_definitions            = var.add_pipeline_definitions
  default_locked_properties           = var.default_locked_properties
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
  sm_instance_crn               = var.sm_instance_crn
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
  scc_attachment_id             = var.scc_attachment_id
  scc_instance_crn              = var.scc_instance_crn
  scc_profile_name              = var.scc_profile_name
  scc_profile_version           = var.scc_profile_version
  scc_scc_api_key_secret_ref    = local.scc_scc_api_key_secret_ref
  scc_use_profile_attachment    = var.scc_use_profile_attachment
  authorization_policy_creation = var.authorization_policy_creation
  enable_insights               = var.enable_insights
  cos_dashboard_url             = var.cos_dashboard_url
  cos_description               = var.cos_description
  cos_documentation_url         = var.cos_documentation_url
  cos_integration_name          = var.cos_integration_name
  link_to_doi_toolchain         = var.link_to_doi_toolchain
  doi_toolchain_id              = var.doi_toolchain_id
  enable_artifactory            = var.enable_artifactory
  artifactory_dashboard_url     = var.artifactory_dashboard_url
  artifactory_integration_name  = var.artifactory_integration_name
  artifactory_user              = var.artifactory_user
  artifactory_repo_name         = var.artifactory_repo_name
  artifactory_repo_url          = var.artifactory_repo_url
  artifactory_token_secret_ref  = local.artifactory_secret_ref
  sm_integration_name           = var.sm_integration_name
  kp_integration_name           = var.kp_integration_name
  slack_integration_name        = var.slack_integration_name
  event_notifications_tool_name = var.event_notifications_tool_name
  event_notifications_crn       = var.event_notifications_crn
  sonarqube_integration_name    = var.sonarqube_integration_name
  sonarqube_user                = var.sonarqube_user
  sonarqube_secret_ref          = local.sonarqube_secret_ref
  sonarqube_is_blind_connection = var.sonarqube_is_blind_connection
  sonarqube_server_url          = var.sonarqube_server_url
}

module "services" {
  source = "./services"

  sm_name                = var.sm_name
  sm_location            = var.sm_location
  sm_resource_group      = var.sm_resource_group
  sm_instance_crn        = var.sm_instance_crn
  kp_name                = var.kp_name
  kp_location            = var.kp_location
  kp_resource_group      = var.kp_resource_group
  enable_secrets_manager = var.enable_secrets_manager
  enable_key_protect     = var.enable_key_protect
}

# This is the structure being passed with each loop
# into `property_data`. It is expected for `properties` to contain property data
#  {
#    "pipeline_id": "cc",
#    "properties": []
#  }

module "pipeline_properties" {
  source = "./customizations/pipeline-property-adder"
  #preprossing the data ensures that a pipeline_id is variable is present
  for_each = tomap({
    for t in local.pre_process_prop_data : t.pipeline_id => t
  })
  property_data = each.value
  # resolve the shorthand to an actual pipeline id
  pipeline_id = (
    (lower(each.value.pipeline_id) == "cc") ? module.pipeline_cc.pipeline_id : each.value.pipeline_id
  )
  config_data = local.config_data
}


# This is the structure being passed with each loop
# into `pipeline_repo_data`. It is expected for `repositories` to contain repo data
#  {
#    "git_token_secret_ref" = ""
#    "pipeline_id" = "cc"
#    "repository_owner" = "test"
#    "repositories" = []
#  }

module "repository_properties" {
  source = "./customizations/repository-adder"
  #preprossing the data ensures that a pipeline_id is variable is present
  for_each = tomap({
    for t in local.pre_process_repo_data : t.pipeline_id => t
  })
  toolchain_id       = ibm_cd_toolchain.toolchain_instance.id
  pipeline_repo_data = each.value
  # resolve the shorthand to an actual pipeline id
  pipeline_id = (lower(each.value.pipeline_id) == "cc") ? module.pipeline_cc.pipeline_id : each.value.pipeline_id
  config_data = local.config_data
}
