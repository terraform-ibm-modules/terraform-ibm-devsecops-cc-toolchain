resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
  count       = (var.sonarqube_user != "") ? 1 : 0
  name        = "sonarqube"
  type        = "integration"
  value       = try(var.sonarqube_tool, "")
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"sonarqube") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_repo" {
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, var.app_repo.tool_id)
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"evidence-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"inventory-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "incident_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"incident-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = var.enable_artifactory ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
  locked      = contains(var.default_locked_properties,"artifactory-dockerconfigjson") ? "true" : "false"
}
