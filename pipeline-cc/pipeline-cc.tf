resource "ibm_cd_tekton_pipeline" "cc_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cc_pipeline_definition" {
  pipeline_id   = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
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
  pipeline_id       = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type            = "manual"
  name            = "CC Manual Trigger"
  event_listener  = "cc-listener"
  enabled         = "true"
  max_concurrent_runs = "1"
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_timed_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type            = "timer"
  name            = "CC Timed Trigger"
  event_listener  = "cc-listener"
  enabled         = "false"
  cron            = "0 4 * * *"
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}