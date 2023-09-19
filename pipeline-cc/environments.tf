resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-api-scan" {
  name        = "opt-in-dynamic-api-scan"
  type        = "text"
  value       = var.opt_in_dynamic_api_scan
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-scan" {
  name        = "opt-in-dynamic-scan"
  type        = "text"
  value       = var.opt_in_dynamic_scan
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-ui-scan" {
  name        = "opt-in-dynamic-ui-scan"
  type        = "text"
  value       = var.opt_in_dynamic_ui_scan
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-auto-close" {
  name        = "opt-in-auto-close"
  type        = "text"
  value       = var.opt_in_auto_close
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-sonar" {
  name        = "opt-in-sonar"
  type        = "text"
  value       = "true"
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_environment-tag" {
  name        = "environment-tag"
  type        = "text"
  value       = var.environment_tag
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_git-token" {
  count       = (var.enable_pipeline_git_token) ? 1 : 0
  name        = "git-token"
  type        = "secure"
  value       = var.pipeline_git_token_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

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

resource "ibm_cd_tekton_pipeline_property" "pipeline_config" {
  name        = "pipeline-config"
  type        = "text"
  value       = var.pipeline_config_path
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_branch" {
  name        = "pipeline-config-branch"
  type        = "text"
  value       = (var.pipeline_config_repo_branch == "") ? var.pipeline_config_repo_branch : var.pipeline_config_repo_branch
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

resource "ibm_cd_tekton_pipeline_property" "pipeline_debug" {
  name        = "pipeline-debug"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.pipeline_debug
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_peer_review_compliance" {
  count       = (var.peer_review_compliance == "") ? 0 : 1
  name        = "peer-review-compliance"
  type        = "text"
  value       = var.peer_review_compliance
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
# }

resource "ibm_cd_tekton_pipeline_property" "slack_notifications" {
  name        = "slack-notifications"
  type        = "text"
  value       = var.slack_notifications
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cos_api_key" {
  count       = (var.cos_bucket_name != "") ? 1 : 0
  name        = "cos-api-key"
  type        = "secure"
  value       = var.cos_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cos_bucket_name" {
  name        = "cos-bucket-name"
  type        = "text"
  value       = var.cos_bucket_name
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cos_endpoint" {
  name        = "cos-endpoint"
  type        = "text"
  value       = var.cos_endpoint
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "doi_environment" {
  name        = "doi-environment"
  type        = "text"
  value       = var.doi_environment
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "doi_toolchain_id" {
  name        = "doi-toolchain-id"
  type        = "text"
  value       = var.doi_toolchain_id
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ibmcloud_api" {
  name        = "ibmcloud-api"
  type        = "text"
  value       = var.ibmcloud_api
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "compliance_base_image" {
  count       = (var.compliance_base_image == "") ? 0 : 1
  name        = "compliance-baseimage"
  type        = "text"
  value       = var.compliance_base_image
  pipeline_id = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dockerjson_config" {
  count       = (var.enable_pipeline_dockerconfigjson) ? 1 : 0
  name        = "pipeline-dockerconfigjson"
  type        = "secure"
  value       = var.pipeline_dockerconfigjson_secret_ref
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
