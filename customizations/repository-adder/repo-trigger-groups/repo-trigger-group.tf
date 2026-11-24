locals {

  # Compare top level variables with equivalent variables in `repository_data`. Values in `repository_data` take precedence.
  # `git_token_secret_ref`
  # `repository_owner`
  # `mode`
  # `default_branch`
  # `worker_id`

  git_token_secret_ref                         = try(var.repository_data.git_token_secret_ref, var.git_token_secret_ref)
  github_app_credential_private_key_secret_ref = try(var.repository_data.github_app_credential_private_key_secret_ref, var.github_app_credential_private_key_secret_ref)
  default_branch                               = try(var.repository_data.default_branch, var.default_branch)
  repository_owner                             = try(var.repository_data.repository_owner, var.repository_owner)
  mode                                         = try(var.repository_data.mode, var.mode)
  worker_id                                    = try(var.repository_data.worker_id, var.worker_id)
  blind_connection                             = try(var.repository_data.blind_connection, var.blind_connection)
  root_url                                     = try(var.repository_data.root_url, var.root_url)
  title                                        = try(var.repository_data.title, var.title)
  #if not provided use `hostedgit` as the default.
  repo_url_raw = try(trimsuffix(var.repository_data.repository_url, ".git"), "")

  # Determine the input repo url to use

  #extend to add support for future providers
  calculated_provider = (
    (strcontains(local.repo_url_raw, "github")) ? "githubconsolidated" :
    (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "hostedgit" : "hostedgit"
  )
  #extend to add support for future providers
  calculated_git_id = (
    (strcontains(local.repo_url_raw, "github.ibm.com")) ? "integrated" :
    (strcontains(local.repo_url_raw, "github")) ? "github" :
    (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "" : ""
  )

  #If mode = link then use the inferred provider and git_id
  #If mode = clone then

  #Use specified provider over calculated provider
  git_provider = (var.repository_data.provider == "") ? local.calculated_provider : var.repository_data.provider

  #Use the specified git id only if a provider is specified
  git_id = (var.repository_data.provider == "") ? local.calculated_git_id : var.repository_data.git_id

  event_listener = (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "ci-listener-gitlab" : "ci-listener"
  # Ensure there is a name for the repository integration. If not use the name of the taken from the `repository_url`
  input_repo_name = try(var.repository_data.name, "")
  repo_name       = (local.input_repo_name == "") ? basename(local.repo_url_raw) : local.input_repo_name

  # Ensure there is at least an empty element for triggers
  triggers = try(var.repository_data.triggers, [])
  #pre-process to ensure the element key is present
  pre_process_trigger_data = flatten([for trigger in local.triggers : {
    type                = (trigger.type == "") ? "manual" : trigger.type
    name                = trigger.name
    worker_id           = (trigger.worker_id == "") ? local.worker_id : trigger.worker_id
    properties          = trigger.properties                                                             # Set to empty list if not set
    event_listener      = (trigger.event_listener == "") ? local.event_listener : trigger.event_listener # If not set infer from repo url
    timezone            = trigger.timezone                                                               #only required by timed trigger
    cron                = trigger.cron                                                                   #Only required for timed trigger
    enabled             = trigger.enabled
    max_concurrent_runs = trigger.max_concurrent_runs
    pipeline_id         = var.pipeline_id
    default_branch      = local.default_branch
    events              = trigger.events
    repo_url            = local.repo_url_raw
    config_data         = var.config_data
    }
  ])

  auth_type = try(var.repository_data.auth_type, var.auth_type, (local.git_token_secret_ref != "") ? "pat" : "oauth")

  github_app_auth_method       = (local.auth_type == "github_app") ? try(var.repository_data.github_app_auth_method, var.github_app_auth_method, "managed") : "managed"
  github_app_credential_app_id = (local.github_app_auth_method == "custom") ? try(var.repository_data.github_app_credential_app_id, var.github_app_credential_app_id, "") : ""

  #
  selected_secret = (local.auth_type == "pat") ? local.git_token_secret_ref : (local.auth_type == "github_app" ? local.github_app_credential_private_key_secret_ref : "")

  secret_ref_prefix = (
    (var.config_data.secrets_provider_type == "kp") ? "{vault::${var.config_data.secrets_integration_name}." :
    (var.config_data.secrets_provider_type == "sm") ? "{vault::${var.config_data.secrets_integration_name}.${var.config_data.secrets_group}." : ""
  )

  #check if provided secret contains the full ref
  is_secret_ref = ((startswith(local.selected_secret, "{vault::")) || (startswith(local.selected_secret, "crn:")) || (startswith(local.selected_secret, "ref://"))) ? true : false
  secret_ref    = (local.is_secret_ref) ? local.selected_secret : "${local.secret_ref_prefix}${local.selected_secret}}"

}

# Create a repository integration
module "app_repo" {
  source                       = "../../repositories"
  tool_name                    = local.repo_name
  toolchain_id                 = var.toolchain_id
  git_provider                 = local.git_provider
  initialization_type          = (local.mode == "clone") ? "clone_if_not_exists" : "link"
  repository_url               = local.repo_url_raw
  source_repository_url        = local.repo_url_raw
  repository_name              = local.repo_name
  is_private_repo              = true
  owner_id                     = local.repository_owner
  issues_enabled               = true
  traceability_enabled         = false
  integration_owner            = ""
  auth_type                    = local.auth_type
  secret_ref                   = (local.selected_secret == "") ? "" : local.secret_ref
  git_id                       = local.git_id
  blind_connection             = local.blind_connection
  root_url                     = local.root_url
  title                        = local.title
  default_git_provider         = ""
  github_app_auth_method       = local.github_app_auth_method
  github_app_credential_app_id = local.github_app_credential_app_id
}


#This is the structure being passed with each loop
# into `trigger_data`
#    {
#     type                =
#     name                =
#     worker_id           =
#     properties          =
#     event_listener      =
#     time_zone           =
#     cron_schedule       =
#     trigger_enable      =
#     max_concurrent_runs =
#     pipeline_id         =
#    }

# Create a Trigger
module "triggers" {
  depends_on = [module.app_repo.repository]
  source     = "../../triggers"
  for_each = tomap({
    for t in local.pre_process_trigger_data : "${t.name}" => t
  })
  trigger_data = each.value
  # This is to ensure that the repository integration has been created before proceeding. A Git trigger requires the tool_id to be available
  repository_integration_id = module.app_repo.repository.tool_id
}
