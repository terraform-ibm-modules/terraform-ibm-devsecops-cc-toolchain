resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
  count       = (var.sonarqube_config == "custom") ? 1 : 0
  name        = "sonarqube"
  type        = "integration"
  value       = try(var.sonarqube_tool, "")
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_sonarqube-config" {
  name        = "sonarqube-config"
  type        = "text"
  value       = var.sonarqube_config
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_repo" {
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, var.app_repo.tool_id)
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "incident_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_event_notifications" {
  type        = "text"
  name        = "event-notifications"
  value       = var.event_notifications
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_doi_api_key" {
  count       = var.link_to_doi_toolchain ? 1 : 0
  name        = "doi-ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_doi_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = var.enable_artifactory ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
}
