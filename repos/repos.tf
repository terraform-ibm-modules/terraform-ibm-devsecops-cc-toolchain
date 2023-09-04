locals {
  initilization_type = (
    (var.initilization_type != "") ? var.initilization_type :
    (var.repository_url != "") ? "link" :
    (var.source_repository_url != "") ? "clone_if_not_exists" : "new"
  )

  auth_type       = (var.auth_type == "pat") ? var.auth_type : "oauth"
  api_token       = (var.auth_type == "pat") ? var.secret_ref : ""
  repo_url        = (local.initilization_type == "link") ? var.repository_url : ""
  source_repo_url = (local.initilization_type == "link") ? "" : var.source_repository_url
  is_private_repo = (var.is_private_repo) ? true : var.is_private_repo
  git_provider = (
    (var.git_provider != "") ? var.git_provider :
    (var.default_git_provider != "") ? var.default_git_provider : "hostedgit"
  )
  issues_enabled       = (var.issues_enabled) ? true : var.issues_enabled
  traceability_enabled = (var.traceability_enabled) ? false : var.traceability_enabled

  git_provider_name = (
    ((local.git_provider == "hostedgit") || (local.git_provider == "gitlab"))
    ? "gitlab"
    : (local.git_provider == "githubconsolidated")
    ? "github"
    : (file("[Error] Unrecognized git provider"))
  )
}

resource "ibm_cd_toolchain_tool_hostedgit" "repository" {
  count        = local.git_provider != "githubconsolidated" ? 1 : 0
  toolchain_id = var.toolchain_id
  name         = var.tool_name
  initialization {
    type            = local.initilization_type
    source_repo_url = local.source_repo_url
    repo_url        = local.repo_url
    private_repo    = local.is_private_repo
    repo_name       = var.repository_name
    git_id          = var.git_id
    owner_id        = var.owner_id
  }
  parameters {
    toolchain_issues_enabled = local.issues_enabled
    enable_traceability      = local.traceability_enabled
    integration_owner        = var.integration_owner
    auth_type                = local.auth_type
    api_token                = local.api_token
  }
}

resource "ibm_cd_toolchain_tool_githubconsolidated" "repository" {
  count        = local.git_provider == "githubconsolidated" ? 1 : 0
  toolchain_id = var.toolchain_id
  name         = var.tool_name
  initialization {
    type            = local.initilization_type
    source_repo_url = local.source_repo_url
    repo_url        = local.repo_url
    private_repo    = local.is_private_repo
    repo_name       = var.repository_name
    git_id          = var.git_id
    owner_id        = var.owner_id

  }
  parameters {
    toolchain_issues_enabled = local.issues_enabled
    enable_traceability      = local.traceability_enabled
    integration_owner        = var.integration_owner
    auth_type                = local.auth_type
    api_token                = local.api_token
  }
}

output "repository_url" {
  value       = local.git_provider != "githubconsolidated" ? (ibm_cd_toolchain_tool_hostedgit.repository[0].parameters[0].repo_url) : (ibm_cd_toolchain_tool_githubconsolidated.repository[0].parameters[0].repo_url)
  description = "The URL of the this repository."
}

output "repository" {
  value       = local.git_provider != "githubconsolidated" ? (ibm_cd_toolchain_tool_hostedgit.repository[0]) : (ibm_cd_toolchain_tool_githubconsolidated.repository[0])
  description = "The URL of the this repository."
}

output "repo_provider" {
  value       = local.git_provider
  description = "The Git provider."
}

output "repo_git_id" {
  value = var.git_id
}

output "repo_provider_name" {
  value       = local.git_provider_name
  description = "Common name for the provider."
}
