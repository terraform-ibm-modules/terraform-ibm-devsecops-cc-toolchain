##############################################################################
# Outputs
##############################################################################

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
