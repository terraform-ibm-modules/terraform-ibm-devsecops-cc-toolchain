resource "ibm_cd_tekton_pipeline" "cc_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cc_pipeline_definition" {
  pipeline_id   = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  scm_source {
    url         = var.pipeline_repo
    branch      = var.pipeline_branch
    path        = var.pipeline_path
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_manual_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type            = var.cc_pipeline_manual_trigger_type
  name            = var.cc_pipeline_manual_trigger_name
  event_listener  = var.cc_pipeline_trigger_listener_name
  disabled        = var.cc_pipeline_manual_trigger_disabled
  max_concurrent_runs = var.cc_pipeline_max_concurrent_runs

}

resource "ibm_cd_tekton_pipeline_trigger" "cc_pipeline_timed_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  type            = var.cc_pipeline_timed_trigger_type
  name            = var.cc_pipeline_timed_trigger_name
  event_listener  = var.cc_pipeline_trigger_listener_name
  disabled        = var.cc_pipeline_timed_trigger_disabled
  cron            = var.cc_pipeline_timed_trigger_cron
}

