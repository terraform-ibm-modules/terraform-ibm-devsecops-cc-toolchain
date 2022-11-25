resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-api-scan" {
  name           = "opt-in-dynamic-api-scan"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-scan" {
  name           = "opt-in-dynamic-scan"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id 
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-dynamic-ui-scan" {
  name           = "opt-in-dynamic-ui-scan"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-auto-close" {
  name           = "opt-in-auto-close"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_opt-in-sonar" {
  name           = "opt-in-sonar"
  type           = "text"
  value          = "true"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_environment-tag" {
  name           = "environment-tag"
  type           = "text"
  value          = "prod_latest"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_git-token" {
  name           = "git-token"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_sonarqube" {
  name           = "sonarqube"
  type           = "text"
  value          = "{}"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id    
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_sonarqube-config" {
  name           = "sonarqube-config"
  type           = "text"
  value          = "default"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = ".pipeline-config.yaml"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id    
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = "master"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id  
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "text"
  value          = var.deployment_repo
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "evidence_repo" {
  name           = "evidence-repo"
  type           = "text"
  value          = var.evidence_repo
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id  
}

resource "ibm_cd_tekton_pipeline_property" "inventory_repo" {
  name           = "inventory-repo"
  type           = "text"
  value          = var.inventory_repo
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "incident_repo" {
  name           = "incident-repo"
  type           = "text"
  value          = var.issues_repo
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_debug" {
  name           = "pipeline-debug"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id  
}

# resource "ibm_cd_tekton_pipeline_property" "pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id   
# }

resource "ibm_cd_tekton_pipeline_property" "slack_notifications" {
  name           = "slack-notifications"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id  
}

resource "ibm_cd_tekton_pipeline_property" "ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "secure"
  value          = format("{vault::%s.ibmcloud-api-key}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cos_api_key" {
  name           = "cos-api-key"
  type           = "secure"
  value          = format("{vault::%s.cos-api-key}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cos_bucket_name" {
  name           = "cos-bucket-name"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id         
}

resource "ibm_cd_tekton_pipeline_property" "cos_endpoint" {
  name           = "cos-endpoint"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "doi_environment" {
  name           = "doi-environment"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id            
}

resource "ibm_cd_tekton_pipeline_property" "doi_toolchain_id" {
  name           = "doi_toolchain_id"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id        
}

resource "ibm_cd_tekton_pipeline_property" "ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "text"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}