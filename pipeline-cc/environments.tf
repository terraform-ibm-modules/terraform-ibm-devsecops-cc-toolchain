
resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_region" {
  name           = "region"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_satellite_cluster_group" {
  name           = "satellite-cluster-group"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_source_environment" {
  name           = "source-environment"
  type           = "text"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_target_environment" {
  name           = "target-environment"
  type           = "text"
  value          = "prod"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_use_v2_collector" {
  name           = "use-v2-collector"
  type           = "text"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_use_v2_summary" {
  name           = "use-v2-summary"
  type           = "text"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_emergency_label" {
  name           = "emergency-label"
  type           = "text"
  value          = "EMERGENCY"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "version" {
  name           = "version"
  type           = "text"
  value          = "v1"
  pipeline_id    = var.pipeline_id          
}


resource "ibm_cd_tekton_pipeline_property" "pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = ".pipeline-config.yaml"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "text"
  value          = var.deployment_repo
  pipeline_id    = var.pipeline_id          
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
  pipeline_id    = var.pipeline_id          
}

# resource "ibm_cd_tekton_pipeline_property" "pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = " "
#   pipeline_id    = var.pipeline_id          
# }

resource "ibm_cd_tekton_pipeline_property" "slack_notifications" {
  name           = "slack-notifications"
  type           = "text"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "secure"
  value          = format("{vault::%s.%s.ibmcloud-api-key}", var.sm_integration_name, var.sm_group)
  pipeline_id    = var.pipeline_id          
}

// Limitation with issues repository url: How to fetch issues repository url 
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "cluster_name" {
  name           = "cluster-name"
  type           = "text"
  value          = var.cluster_name
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id        
}

resource "ibm_cd_tekton_pipeline_property" "cluster_namespace" {
  name           = "cluster-namespace"
  type           = "text"
  value          = var.cluster_namespace
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cluster_region" {
  name           = "cluster-region"
  type           = "text"
  value          = var.cluster_region
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "cos_api_key" {
  name           = "cos-api-key"
  type           = "secure"
  value          = format("{vault::%s.%s.cos-api-key}", var.sm_integration_name, var.sm_group)
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "cos_bucket_name" {
  name           = "cos-bucket-name"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "cos_endpoint" {
  name           = "cos-endpoint"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "doi_environment" {
  name           = "doi-environment"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "doi_toolchain_id" {
  name           = "doi_toolchain_id"
  type           = "text"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "text"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}
