resource "ibm_iam_authorization_policy" "toolchain_secretsmanager_auth_policy" {
  count                       = (var.enable_secrets_manager) && (var.authorization_policy_creation != "disabled") ? 1 : 0
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "secrets-manager"
  target_resource_instance_id = var.sm_instance_guid
  roles                       = ["Viewer", "SecretsReader"]
}

resource "ibm_iam_authorization_policy" "toolchain_keyprotect_auth_policy" {
  count                       = (var.enable_key_protect) && (var.authorization_policy_creation != "disabled") ? 1 : 0
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "kms"
  target_resource_instance_id = var.sm_instance_guid
  roles                       = ["Viewer", "ReaderPlus"]
}

locals {
  sm_integration_name    = "sm-compliance-secrets"
  kp_integration_name    = "kp-compliance-secrets"
  slack_integration_name = "slack-compliance"
}

resource "ibm_cd_toolchain_tool_secretsmanager" "secretsmanager" {
  count        = var.enable_secrets_manager ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name                = local.sm_integration_name
    location            = var.sm_location
    resource_group_name = var.sm_resource_group
    instance_name       = var.sm_name
  }
}

resource "ibm_cd_toolchain_tool_keyprotect" "keyprotect" {
  count        = var.enable_key_protect ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name                = local.kp_integration_name
    location            = var.kp_location
    resource_group_name = var.kp_resource_group
    instance_name       = var.kp_name
  }
}

resource "ibm_cd_toolchain_tool_slack" "slack_tool" {
  count        = var.enable_slack ? 1 : 0
  toolchain_id = var.toolchain_id
  name         = local.slack_integration_name
  parameters {
    webhook          = format("{vault::%s.${var.slack_webhook_secret_name}}", var.secret_tool)
    channel_name     = var.slack_channel_name
    team_name        = var.slack_team_name
    pipeline_fail    = var.slack_pipeline_fail
    pipeline_start   = var.slack_pipeline_start
    pipeline_success = var.slack_pipeline_success
    toolchain_bind   = var.slack_toolchain_bind
    toolchain_unbind = var.slack_toolchain_unbind
  }
}

resource "ibm_cd_toolchain_tool_devopsinsights" "insights_tool" {
  count        = var.link_to_doi_toolchain ? 0 : 1
  toolchain_id = var.toolchain_id
}

resource "ibm_cd_toolchain_tool_custom" "link_to_insights" {
  count        = var.link_to_doi_toolchain ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    type              = "doi-toolchain"
    lifecycle_phase   = "LEARN"
    image_url         = "data:image/png;base64,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"
    documentation_url = "https://cloud.ibm.com/devops/insights/overviewNew?toolchainId=${var.doi_toolchain_id}"
    name              = "Link existing DOI to Toolchain"
    dashboard_url     = "https://cloud.ibm.com/devops/insights/overviewNew?toolchainId=${var.doi_toolchain_id}"
    description       = "The toolchain that contains the Devops Insights instance CC interacts with."
  }
}

resource "ibm_cd_toolchain_tool_custom" "cos_integration" {
  toolchain_id = var.toolchain_id
  parameters {
    type              = "cos-bucket"
    lifecycle_phase   = "MANAGE"
    image_url         = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJlMDR6eGgxMzJhIiB4MT0iODI3LjUiIHkxPSI0NjkwLjUiIHgyPSI4MzguNSIgeTI9IjQ2OTAuNSIgZ3JhZGllbnRUcmFuc2Zvcm09InRyYW5zbGF0ZSgtODIzLjUgLTQ2NjkuNSkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIi8+PHN0b3Agb2Zmc2V0PSIuODg4IiBzdG9wLW9wYWNpdHk9IjAiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0idjAwNnBmNmY3YyIgeTE9IjMyIiB4Mj0iMzIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIiBzdG9wLWNvbG9yPSIjYTU2ZWZmIi8+PHN0b3Agb2Zmc2V0PSIuOSIgc3RvcC1jb2xvcj0iIzBmNjJmZSIvPjwvbGluZWFyR3JhZGllbnQ+PG1hc2sgaWQ9InA4ejNueDg4bGIiIHg9IjAiIHk9IjAiIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgbWFza1VuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PGNpcmNsZSBjeD0iNyIgY3k9IjI1IiByPSIxIiBmaWxsPSIjZmZmIi8+PHBhdGggZD0iTTI4IDIwaC0ydjJoMnY2SDR2LTZoMTB2LTJINGEyIDIgMCAwIDAtMiAydjZhMiAyIDAgMCAwIDIgMmgyNGEyIDIgMCAwIDAgMi0ydi02YTIgMiAwIDAgMC0yLTJ6IiBmaWxsPSIjZmZmIi8+PHBhdGggdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDkuNSAyMSkiIGZpbGw9InVybCgjZTA0enhoMTMyYSkiIGQ9Ik00IDE5aDExdjRINHoiLz48L21hc2s+PC9kZWZzPjxnIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgZGF0YS1uYW1lPSJMaWdodCB0aGVtZSBpY29ucyI+PGcgbWFzaz0idXJsKCNwOHozbng4OGxiKSI+PHBhdGggZmlsbD0idXJsKCN2MDA2cGY2ZjdjKSIgZD0iTTAgMGgzMnYzMkgweiIvPjwvZz48cGF0aCBkPSJNMTggMTBoLThWMmg4em0tNi0yaDRWNGgtNHptMTAgNmgtNnY4aDh2LTZoNlY4aC04em0wIDZoLTR2LTRoNHptNi0xMHY0aC00di00eiIgZmlsbD0iIzAwMWQ2YyIvPjwvZz48L2c+PC9zdmc+"
    documentation_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
    name              = "Evidence Store"
    dashboard_url     = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
    description       = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
  }
}

resource "ibm_cd_toolchain_tool_securitycompliance" "scc_tool" {
  count        = (var.scc_enable_scc) ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name               = var.scc_integration_name
    evidence_namespace = "cc"
    evidence_repo_url  = var.scc_evidence_repo
  }
}

output "secret_tool" {
  value = (var.enable_key_protect) ? local.kp_integration_name : format("%s.%s", local.sm_integration_name, var.sm_secret_group)
  # Before returning this tool integration name
  # used to construct {vault:: secret references,
  # the authorization_policy must have been successfully created,
  # and the tool integration must have been created,
  # otherwise the secret references would not resolve and
  # other tools using secret references could give errors during tool integration creation
  depends_on = [
    ibm_iam_authorization_policy.toolchain_secretsmanager_auth_policy,
    ibm_iam_authorization_policy.toolchain_keyprotect_auth_policy,
    ibm_cd_toolchain_tool_secretsmanager.secretsmanager,
    ibm_cd_toolchain_tool_keyprotect.keyprotect
  ]
  description = "Used as part of secret references to point to the secret store tool integration"
}
