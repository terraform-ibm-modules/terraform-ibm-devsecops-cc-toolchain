locals {
  # Note terraform 1.3.x allows startswith() function
  # but terraform 1.x uses regexall
  is_staging = length(regexall("^crn:v1:staging:.*$", var.toolchain_crn)) > 0
  # is_staging = startswith(var.toolchain_crn, "crn:v1:staging:")
  git_dev = "https://dev.us-south.git.test.cloud.ibm.com"
  git_mon01 = "https://mon01.git.cloud.ibm.com"
  git_fr2 = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev 
    : (var.toolchain_region == "eu-fr2")? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )
  # in dev/staging, compliance_pipelines_git_server is dev and clone_from_git_server is mon01
  clone_from_git_server = (
    (local.is_staging) ? local.git_mon01 : local.compliance_pipelines_git_server
  )

  pipeline_config_repo_branch = (
    (var.pipeline_config_repo_branch != "") ? 
    var.pipeline_config_repo_branch : (var.app_repo_branch != "") ? 
    var.app_repo_branch : "master"
  )

  app_repo_git_provider = ((length(var.app_repo_existing_git_provider) > 0)? var.app_repo_existing_git_provider
          : "hostedgit"
        )

  app_repo_git_id = (length(var.app_repo_existing_git_id) > 0)? var.app_repo_existing_git_id : ""
}

resource "ibm_cd_toolchain_tool_hostedgit" "app_repo_existing_hostedgit" {
  count = (local.app_repo_git_provider == "hostedgit") ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "link"
    repo_url  = var.app_repo_existing_url
    git_id    = local.app_repo_git_id
    owner_id  = var.app_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.app_repo_auth_type
    api_token                = ((var.app_repo_auth_type == "pat") ?
    format("{vault::%s.${var.app_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_githubconsolidated" "app_repo_existing_githubconsolidated" {
  count = (local.app_repo_git_provider == "githubconsolidated") ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "link"
    repo_url = var.app_repo_existing_url
    git_id = local.app_repo_git_id
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.app_repo_auth_type
    api_token                = ((var.app_repo_auth_type == "pat") ?
    format("{vault::%s.${var.app_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_config_repo_existing_hostedgit" {
  count = (var.pipeline_config_repo_existing_url == "") ? 0 : 1 
  toolchain_id = var.toolchain_id
  name         = "pipeline-config-repo"
  initialization {
    type     = "link"
    repo_url = var.pipeline_config_repo_existing_url
    git_id   = ""
    owner_id = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.pipeline_config_repo_auth_type
    api_token                = ((var.pipeline_config_repo_auth_type == "pat") ?
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_config_repo_clone_from_hostedgit" {
  count = (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1 

  toolchain_id = var.toolchain_id
  name         = "pipeline-config-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = var.pipeline_config_repo_clone_from_url
    private_repo    = true
    repo_name       = join("-", [ var.repositories_prefix, "pipeline-config-repo" ])
    git_id          = ""    
    owner_id        = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.pipeline_config_repo_auth_type
    api_token                = ((var.pipeline_config_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_repo" {
  toolchain_id = var.toolchain_id
  name         = "pipeline-repo"
  initialization {
    type     = "link"
    repo_url = format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)
    owner_id = var.compliance_pipeline_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.compliance_pipeline_repo_auth_type
    api_token                = ((var.compliance_pipeline_repo_auth_type == "pat") ?
    format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "inventory_repo" {
  toolchain_id = var.toolchain_id
  name         = "inventory-repo"
  initialization {
    type         = "link"
    repo_url     = var.inventory_repo_url
    private_repo = true
    owner_id     = var.inventory_group
  }
  parameters {
    toolchain_issues_enabled  = false
    enable_traceability       = false
    auth_type                 = var.inventory_repo_auth_type
    api_token                 = ((var.inventory_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "evidence_repo" {
  toolchain_id = var.toolchain_id
  name         = "evidence-repo"
  initialization {
    type         = "link"
    repo_url     = var.evidence_repo_url
    private_repo = true
    owner_id     = var.evidence_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.evidence_repo_auth_type
    api_token                = ((var.evidence_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "issues_repo" {
  toolchain_id = var.toolchain_id
  name         = "issues-repo"
  initialization {
    type         = "link"
    repo_url     = var.issues_repo_url
    private_repo = true
    owner_id     = var.issues_group
  }
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
    auth_type                = var.issues_repo_auth_type
    api_token                = ((var.issues_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.issues_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "external_properties_repo" {
  count        = var.enable_external_properties ? 1 : 0
  toolchain_id = var.toolchain_id
  name         = "external-properties-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = var.external_properties_repo_url
    repo_name       = "compliance-pipeline-properties"
    owner_id        = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.external_properties_repo_auth_type
    api_token                = ((var.external_properties_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.external_properties_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

output "app_repo_url" {
  value = ((local.app_repo_git_provider == "githubconsolidated") ? 
  ibm_cd_toolchain_tool_githubconsolidated.app_repo_existing_githubconsolidated[0].parameters[0].repo_url : ibm_cd_toolchain_tool_hostedgit.app_repo_existing_hostedgit[0].parameters[0].repo_url
  )
}

output "app_repo" {
  value = ((local.app_repo_git_provider == "githubconsolidated") ? 
  ibm_cd_toolchain_tool_githubconsolidated.app_repo_existing_githubconsolidated : ibm_cd_toolchain_tool_hostedgit.app_repo_existing_hostedgit
  )
}

output "pipeline_config_repo" {
  value = (var.pipeline_config_repo_existing_url == "") ? ibm_cd_toolchain_tool_hostedgit.pipeline_config_repo_clone_from_hostedgit : ibm_cd_toolchain_tool_hostedgit.pipeline_config_repo_existing_hostedgit
}

output "pipeline_config_repo_branch" {
  value = local.pipeline_config_repo_branch
  description = "The config or app repo branch containing the .pipeline-config.yaml file; usually main or master."
}

output "pipeline_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.pipeline_repo.parameters[0].repo_url
  description = "This repository url contains the tekton definitions for compliance pipelines"
}

output "external_properties_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.external_properties_repo[0].parameters[0].repo_url
}

output "inventory_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo.parameters[0].repo_url
}

output "evidence_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo.parameters[0].repo_url
}

output "issues_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo.parameters[0].repo_url
}

output "inventory_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo
}

output "evidence_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo
}

output "issues_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo
}