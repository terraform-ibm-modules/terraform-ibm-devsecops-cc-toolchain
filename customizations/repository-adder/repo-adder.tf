locals {
  # Ensure there is at least an empty list set for repositories
  repositories = try(var.pipeline_repo_data.repositories, [])
  # Ensure there is a `git_token_secret_ref` entry
  git_token_secret_ref = try(var.pipeline_repo_data.git_token_secret_ref, "")
  # Ensure there is a `repository_owner` entry
  repository_owner = try(var.pipeline_repo_data.repository_owner, "")
  # Ensure there is a `default_branch`. Set to `master` as a default if entry is not present
  default_branch = try(var.pipeline_repo_data.default_branch, "master")
  # Ensure there is a `mode` entry. The default behaviour is `link`to specified  repository.
  mode = try(var.pipeline_repo_data.mode, "link")
  # Ensure there is a `worker_id` entry. The default is is `public` -> managed worker
  worker_id        = try(var.pipeline_repo_data.worker_id, "public")
  provider         = try(var.pipeline_repo_data.provider, "")
  git_id           = try(var.pipeline_repo_data.git_id, "")
  blind_connection = try(var.pipeline_repo_data.blind_connection, "")
  root_url         = try(var.pipeline_repo_data.root_url, "")
  title            = try(var.pipeline_repo_data.title, "")

  # Ensure repositories have the same structure
  pre_process_repo_data = flatten([for repository in local.repositories : {
    repository_url       = try(repository.repository_url, "")                               # Required
    default_branch       = try(repository.default_branch, local.default_branch)             # If not set read from parent
    mode                 = try(repository.mode, local.mode)                                 # if not set, read from parent
    provider             = try(repository.provider, local.provider)                         # only used when mode is set to clone otherwise determine from repo url
    git_id               = try(repository.git_id, local.git_id)                             # custom git id otherwise inferred determine from provided url
    git_token_secret_ref = try(repository.git_token_secret_ref, local.git_token_secret_ref) # if not set, read from parent
    repository_owner     = try(repository.repository_owner, local.repository_owner)         # If not set, read from parent
    name                 = try(repository.name, "")                                         # Only used in clone mode
    worker_id            = try(repository.worker_id, local.worker_id)                       # If not set, read from parent
    blind_connection     = try(repository.blind_connection, local.blind_connection)
    root_url             = try(repository.root_url, local.root_url)
    title                = try(repository.title, local.title)
    triggers = flatten([for trigger in try(repository.triggers, []) : { #loop through triggers, if they exist
      # This is to ensure that all the properties are present. Trigger validation will happen in the trigger module
      type                = try(trigger.type, "") #If type is not set, default to "manual"
      name                = try(trigger.name, "") # If trigger name is not set, leave empty
      worker_id           = try(trigger.worker_id, "")
      properties          = try(trigger.properties, [])
      cron                = try(trigger.cron, "")
      enabled             = try(trigger.enabled, true)
      event_listener      = try(trigger.event_listener, "")
      events              = try(trigger.events, "[]")
      timezone            = try(trigger.timezone, "")
      max_concurrent_runs = try(trigger.max_concurrent_runs, 1)
    }])
    }
  ])
}


# This is the structure being passed with each loop
# into `repository_data`
#   {
#      "default_branch" = "main"
#      "git_token_secret_ref" = "ref"
#      "mode" = "clone"
#      "name" = "test_repo"
#      "owner" = "test"
#      "repository_url" = "https://eu-es.git.cloud.ibm.com/....."
#      "triggers" = []
#      "type" = "manual"
#      "worker_id" = "public"
#      "events" = []
#      "provider" = ""
#      "git_id"   = ""
#    }

module "repos_and_triggers" {
  source = "./repo-trigger-groups"
  for_each = tomap({
    for t in local.pre_process_repo_data : "${t.repository_url}" => t
  })
  repository_owner     = local.repository_owner
  toolchain_id         = var.toolchain_id
  git_token_secret_ref = local.git_token_secret_ref
  repository_data      = each.value # each repository payload
  pipeline_id          = var.pipeline_id
  default_branch       = local.default_branch
  mode                 = local.mode
  worker_id            = local.worker_id
  config_data          = var.config_data
}
