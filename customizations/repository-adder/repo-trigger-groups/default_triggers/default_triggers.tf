locals {
  repo_name = basename(var.repository_url)
  listener = (
    (strcontains(var.repository_url, "git.cloud.ibm.com")) ? "ci-listener-gitlab" : "ci-listener"
  )
  manual       = true
  git          = true
  pr           = false
  repo_url_raw = try(trimsuffix(var.repository_url, ".git"), "")
  repo_url     = format("%s%s", local.repo_url_raw, ".git")
}

# MANUAL TRIGGER FOR CI PIPELINE

resource "ibm_cd_tekton_pipeline_trigger" "pipeline_manual_trigger" {
  count               = (local.manual) ? 1 : 0
  pipeline_id         = var.pipeline_id
  type                = "manual"
  name                = join(" - ", ["Manual", local.repo_name])
  event_listener      = local.listener
  enabled             = true
  max_concurrent_runs = var.max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_app_name" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = "app-name"
  type        = "text"
  value       = local.repo_name
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_branch" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = "branch"
  type        = "text"
  value       = var.branch
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_repo_url" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = "repository"
  type        = "integration"
  value       = var.repository_integration_id
  path        = "parameters.repo_url"
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

# GIT TRIGGER FOR CI PIPELINE
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_scm_trigger" {
  count          = (local.git) ? 1 : 0
  pipeline_id    = var.pipeline_id
  type           = "scm"
  name           = join(" - ", ["Git", local.repo_name])
  event_listener = local.listener
  events         = ["push"]
  enabled        = true
  source {
    type = "git"
    properties {
      url    = local.repo_url
      branch = var.branch
    }
  }
  max_concurrent_runs = var.max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_git_app_name" {
  count       = (local.git) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = "app-name"
  type        = "text"
  value       = local.repo_name
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_scm_trigger[0].trigger_id
  #locked     = local.input_locked
}
