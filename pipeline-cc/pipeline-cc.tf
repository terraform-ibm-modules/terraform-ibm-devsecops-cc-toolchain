resource "ibm_cd_tekton_pipeline" "cc_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.worker_id
  }
  enable_notifications = var.enable_pipeline_notifications
}

resource "ibm_cd_tekton_pipeline_definition" "cc_pipeline_definition" {
  count       = ((var.pipeline_git_tag == "") && (var.add_pipeline_definitions)) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.pipeline_repo_url
      branch = var.pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cc_tekton_definition_tag" {
  count       = ((var.pipeline_git_tag != "") && (var.add_pipeline_definitions)) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      tag  = var.pipeline_git_tag
      path = var.pipeline_path
      url  = var.pipeline_repo_url
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_manual_trigger" {
  count               = (var.create_triggers) ? 1 : 0
  pipeline_id         = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type                = "manual"
  name                = var.trigger_manual_name
  event_listener      = "cc-listener"
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = "1"
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_timed_trigger" {
  count          = (var.create_triggers) ? 1 : 0
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type           = "timer"
  name           = var.trigger_timed_name
  event_listener = "cc-listener"
  timezone       = var.trigger_timed_timezone
  enabled        = var.trigger_timed_enable
  cron           = var.trigger_timed_cron_schedule
}
