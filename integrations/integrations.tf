resource "ibm_iam_authorization_policy" "toolchain_secretsmanager_auth_policy" {
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "secrets-manager"
  target_resource_instance_id = var.sm_instance_guid
  roles                       = ["Viewer", "SecretsReader"]
}

#resource "ibm_iam_authorization_policy" "toolchain_keyprotect_auth_policy" {
#  source_service_name         = "toolchain"
#  source_resource_instance_id = var.toolchain_id
#  target_service_name         = "kms"
#  target_resource_instance_id = var.key_protect_instance_guid
#  roles                       = ["Viewer", "ReaderPlus"]
#}

#resource "ibm_cd_toolchain_tool_keyprotect" "keyprotect" {
#  toolchain_id = var.toolchain_id
#  parameters {
#    name                = var.key_protect_integration_name
#    location            = var.kp_region
#    resource_group_name = var.kp_resource_group
#    instance_name       = var.key_protect_instance_name
#  }
#}

locals {
  # sm_integration_name = "SM Integration Instance"
  sm_integration_name = "sm-compliance-secrets"
}

resource "ibm_cd_toolchain_tool_secretsmanager" "secretsmanager" {
  toolchain_id = var.toolchain_id
  parameters {
    name                = local.sm_integration_name
    location            = var.sm_location
    resource_group_name = var.sm_resource_group
    instance_name       = var.sm_name
  }
}

resource "ibm_cd_toolchain_tool_devopsinsights" "insights_tool" {
  toolchain_id = var.toolchain_id
}

#resource "ibm_cd_toolchain_tool_slack" "slack_tool" {
#  toolchain_id = var.toolchain_id
#  parameters {
#    api_token = var.slack_api_token
#    channel_name = var.slack_channel_name
#    team_url = var.slack_user_name
#    pipeline_start = true
#    pipeline_success = true
#    pipeline_fail = true
#    toolchain_bind = true
#    toolchain_unbind = true
#  }
#}

resource "ibm_cd_toolchain_tool_custom" "cos_integration" {
  toolchain_id = var.toolchain_id
  parameters {
      type = "cos-bucket"
      lifecycle_phase = "MANAGE"
      image_url = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJlMDR6eGgxMzJhIiB4MT0iODI3LjUiIHkxPSI0NjkwLjUiIHgyPSI4MzguNSIgeTI9IjQ2OTAuNSIgZ3JhZGllbnRUcmFuc2Zvcm09InRyYW5zbGF0ZSgtODIzLjUgLTQ2NjkuNSkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIi8+PHN0b3Agb2Zmc2V0PSIuODg4IiBzdG9wLW9wYWNpdHk9IjAiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0idjAwNnBmNmY3YyIgeTE9IjMyIiB4Mj0iMzIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIiBzdG9wLWNvbG9yPSIjYTU2ZWZmIi8+PHN0b3Agb2Zmc2V0PSIuOSIgc3RvcC1jb2xvcj0iIzBmNjJmZSIvPjwvbGluZWFyR3JhZGllbnQ+PG1hc2sgaWQ9InA4ejNueDg4bGIiIHg9IjAiIHk9IjAiIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgbWFza1VuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PGNpcmNsZSBjeD0iNyIgY3k9IjI1IiByPSIxIiBmaWxsPSIjZmZmIi8+PHBhdGggZD0iTTI4IDIwaC0ydjJoMnY2SDR2LTZoMTB2LTJINGEyIDIgMCAwIDAtMiAydjZhMiAyIDAgMCAwIDIgMmgyNGEyIDIgMCAwIDAgMi0ydi02YTIgMiAwIDAgMC0yLTJ6IiBmaWxsPSIjZmZmIi8+PHBhdGggdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDkuNSAyMSkiIGZpbGw9InVybCgjZTA0enhoMTMyYSkiIGQ9Ik00IDE5aDExdjRINHoiLz48L21hc2s+PC9kZWZzPjxnIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgZGF0YS1uYW1lPSJMaWdodCB0aGVtZSBpY29ucyI+PGcgbWFzaz0idXJsKCNwOHozbng4OGxiKSI+PHBhdGggZmlsbD0idXJsKCN2MDA2cGY2ZjdjKSIgZD0iTTAgMGgzMnYzMkgweiIvPjwvZz48cGF0aCBkPSJNMTggMTBoLThWMmg4em0tNi0yaDRWNGgtNHptMTAgNmgtNnY4aDh2LTZoNlY4aC04em0wIDZoLTR2LTRoNHptNi0xMHY0aC00di00eiIgZmlsbD0iIzAwMWQ2YyIvPjwvZz48L2c+PC9zdmc+"
      documentation_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      name = "Evidence Store"
      dashboard_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      description = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
  }
}

#resource "ibm_cd_toolchain_tool_securitycompliance" "scc_tool" {
#  toolchain_id = var.toolchain_id
#  parameters {
#    name = "Security and Compliance"
#    evidence_repo_name = var.scc_evidence_repo
#    scope = var.scc_scope
#    profile = var.scc_profile
#    api_key = var.ibm_cloud_api_key
#  }
#}

output "secret_tool" {
  value = format("%s.%s", local.sm_integration_name, var.sm_secret_group)
  # Before returning this tool integration name
  # used to construct {vault:: secret references,
  # the authorization_policy must have been successfully created,
  # and the tool integration must have been created,
  # otherwise the secret references would not resolve and
  # other tools using secret references could give errors during tool integration creation
  depends_on = [
    ibm_iam_authorization_policy.toolchain_secretsmanager_auth_policy,
    ibm_cd_toolchain_tool_secretsmanager.secretsmanager
  ]
  description = "Used as part of secret references to point to the secret store tool integration"
}