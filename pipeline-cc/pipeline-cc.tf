resource "ibm_cd_tekton_pipeline" "cc_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cc_pipeline_definition" {
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

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_manual_trigger" {
  pipeline_id         = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type                = "manual"
  name                = var.trigger_manual_name
  event_listener      = "cc-listener"
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = "1"
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_timed_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type           = "timer"
  name           = var.trigger_timed_name
  event_listener = "cc-listener"
  enabled        = var.trigger_timed_enable
  cron           = var.trigger_timed_cron_schedule
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}
