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
  enabled        = var.trigger_timed_enable
  cron           = var.trigger_timed_cron_schedule
}

############ Pruner Triggers   #############################
resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_manual_pruner_trigger" {
  count          = (var.create_triggers) ? 1 : 0
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type           = "manual"
  name           = var.trigger_manual_pruner_name
  event_listener = "prune-evidence-listener"
  enabled        = var.trigger_manual_pruner_enable #true
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_manual_pruner_trigger_property_batch" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_manual_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_manual_pruner_trigger_property_branch" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_manual_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_manual_pruner_trigger_property_retention" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-retention-days"
  type        = "text"
  value       = ""
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_manual_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_manual_pruner_trigger_property_v1" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_manual_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_manual_pruner_trigger_property_v2" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_manual_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_timed_pruner_trigger" {
  count          = (var.create_triggers) ? 1 : 0
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type           = "timer"
  name           = var.trigger_timed_pruner_name
  event_listener = "prune-evidence-listener"
  cron           = "0 2 * * *"
  timezone       = "UTC"
  enabled        = var.trigger_timed_pruner_enable #false
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_timed_pruner_trigger_property_batch" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_timed_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_timed_pruner_trigger_property_branch" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_timed_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_timed_pruner_trigger_property_retention" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "evidence-retention-days"
  type        = "text"
  value       = "365"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_timed_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_timed_pruner_trigger_property_v1" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_timed_pruner_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cc_pipeline_timed_pruner_trigger_property_v2" {
  count       = (var.create_triggers) ? 1 : 0
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cc_pipeline_timed_pruner_trigger[0].trigger_id
}
