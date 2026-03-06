locals {
  #event notifications crn has the form "crn:v1:bluemix:public:event-notifications:us-south:a/7f5b4015add74dc49d02eb2e41050aaa:XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX::"
  #need to extract the XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX segment as the event notifications id
  forward_slash_split    = try(split("/", var.event_notifications_crn)[1], "")
  event_notifications_id = try(split(":", local.forward_slash_split)[1], "")

  #Secrets Manager crn has the form "crn:v1:bluemix:public:secrets-manager:us-south:a/7f5b4015add74dc49d02eb2e41050aaa:XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX::
  #need to extract the XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX segment as the Secrets Manager instance id
  forward_slash_split_sm = try(split("/", var.sm_instance_crn)[1], "")
  secrets_manager_id     = try(split(":", local.forward_slash_split_sm)[1], "")

  sm_integration_name    = var.sm_integration_name
  kp_integration_name    = var.kp_integration_name
  slack_integration_name = var.slack_integration_name
}

resource "ibm_iam_authorization_policy" "toolchain_secretsmanager_auth_policy" {
  count                       = (var.enable_secrets_manager) && (var.authorization_policy_creation != "disabled") ? 1 : 0
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "secrets-manager"
  target_resource_instance_id = (var.sm_instance_crn == "") ? var.sm_instance_guid : local.secrets_manager_id
  roles                       = ["Viewer", "SecretsReader"]
}

resource "ibm_iam_authorization_policy" "toolchain_keyprotect_auth_policy" {
  count                       = (var.enable_key_protect) && (var.authorization_policy_creation != "disabled") ? 1 : 0
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "kms"
  target_resource_instance_id = var.kp_instance_guid
  roles                       = ["Viewer", "ReaderPlus"]
}

resource "ibm_iam_authorization_policy" "toolchain_event_notification_auth_policy" {
  count                       = ((var.event_notifications_crn != "") && (var.authorization_policy_creation != "disabled")) ? 1 : 0
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "event-notifications"
  target_resource_instance_id = local.event_notifications_id
  roles                       = ["Event Source Manager", "Reader"]
}

resource "ibm_cd_toolchain_tool_secretsmanager" "secretsmanager" {
  count        = (var.enable_secrets_manager == true && var.sm_instance_crn == "") ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name                = local.sm_integration_name
    location            = var.sm_location
    resource_group_name = var.sm_resource_group
    instance_name       = var.sm_name
  }
}

resource "ibm_cd_toolchain_tool_secretsmanager" "secretsmanager_crn" {
  count = (var.enable_secrets_manager == true && var.sm_instance_crn != "") ? 1 : 0
  parameters {
    name             = local.sm_integration_name
    instance_id_type = "instance-crn"
    instance_crn     = var.sm_instance_crn
  }
  toolchain_id = var.toolchain_id
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
    webhook          = var.slack_webhook_secret_ref
    channel_name     = var.slack_channel_name
    team_name        = var.slack_team_name
    pipeline_fail    = var.slack_pipeline_fail
    pipeline_start   = var.slack_pipeline_start
    pipeline_success = var.slack_pipeline_success
    toolchain_bind   = var.slack_toolchain_bind
    toolchain_unbind = var.slack_toolchain_unbind
  }
}

resource "ibm_cd_toolchain_tool_cos" "cos_tool_integration" {
  count        = (var.enable_cos == true && var.use_legacy_cos_tool == false) ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name                   = var.cos_integration_name
    endpoint               = var.cos_endpoint
    instance_crn           = var.cos_instance_crn
    cos_api_key            = var.cos_api_key_secret_ref
    bucket_name            = var.cos_bucket_name
    hmac_access_key_id     = var.cos_hmac_access_key_id_ref
    hmac_secret_access_key = var.cos_hmac_secret_access_key_ref
    auth_type              = (var.cos_hmac_access_key_id_ref != "" && var.cos_hmac_secret_access_key_ref != "") ? "hmac" : null
  }
}

data "ibm_cd_toolchain_tool_cos" "cos_tool_data" {
  count        = (var.enable_cos == true && var.use_legacy_cos_tool == false) ? 1 : 0
  toolchain_id = var.toolchain_id
  tool_id      = ibm_cd_toolchain_tool_cos.cos_tool_integration[0].tool_id
}

resource "ibm_cd_toolchain_tool_custom" "cos_integration" {
  count        = (var.enable_cos == true && var.use_legacy_cos_tool == true) ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    type              = "cos-bucket"
    lifecycle_phase   = "MANAGE"
    image_url         = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMiAzMiI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJlMDR6eGgxMzJhIiB4MT0iODI3LjUiIHkxPSI0NjkwLjUiIHgyPSI4MzguNSIgeTI9IjQ2OTAuNSIgZ3JhZGllbnRUcmFuc2Zvcm09InRyYW5zbGF0ZSgtODIzLjUgLTQ2NjkuNSkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIi8+PHN0b3Agb2Zmc2V0PSIuODg4IiBzdG9wLW9wYWNpdHk9IjAiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCBpZD0idjAwNnBmNmY3YyIgeTE9IjMyIiB4Mj0iMzIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj48c3RvcCBvZmZzZXQ9Ii4xIiBzdG9wLWNvbG9yPSIjYTU2ZWZmIi8+PHN0b3Agb2Zmc2V0PSIuOSIgc3RvcC1jb2xvcj0iIzBmNjJmZSIvPjwvbGluZWFyR3JhZGllbnQ+PG1hc2sgaWQ9InA4ejNueDg4bGIiIHg9IjAiIHk9IjAiIHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgbWFza1VuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PGNpcmNsZSBjeD0iNyIgY3k9IjI1IiByPSIxIiBmaWxsPSIjZmZmIi8+PHBhdGggZD0iTTI4IDIwaC0ydjJoMnY2SDR2LTZoMTB2LTJINGEyIDIgMCAwIDAtMiAydjZhMiAyIDAgMCAwIDIgMmgyNGEyIDIgMCAwIDAgMi0ydi02YTIgMiAwIDAgMC0yLTJ6IiBmaWxsPSIjZmZmIi8+PHBhdGggdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDkuNSAyMSkiIGZpbGw9InVybCgjZTA0enhoMTMyYSkiIGQ9Ik00IDE5aDExdjRINHoiLz48L21hc2s+PC9kZWZzPjxnIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgZGF0YS1uYW1lPSJMaWdodCB0aGVtZSBpY29ucyI+PGcgbWFzaz0idXJsKCNwOHozbng4OGxiKSI+PHBhdGggZmlsbD0idXJsKCN2MDA2cGY2ZjdjKSIgZD0iTTAgMGgzMnYzMkgweiIvPjwvZz48cGF0aCBkPSJNMTggMTBoLThWMmg4em0tNi0yaDRWNGgtNHptMTAgNmgtNnY4aDh2LTZoNlY4aC04em0wIDZoLTR2LTRoNHptNi0xMHY0aC00di00eiIgZmlsbD0iIzAwMWQ2YyIvPjwvZz48L2c+PC9zdmc+"
    documentation_url = var.cos_documentation_url
    name              = var.cos_integration_name
    dashboard_url     = var.cos_dashboard_url
    description       = var.cos_description
  }
}

resource "ibm_cd_toolchain_tool_sonarqube" "cd_toolchain_tool_sonarqube_instance" {
  count        = (var.sonarqube_server_url != "") ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name             = var.sonarqube_integration_name
    user_login       = var.sonarqube_user
    user_password    = var.sonarqube_secret_ref
    blind_connection = var.sonarqube_is_blind_connection
    server_url       = var.sonarqube_server_url
  }
}

resource "ibm_cd_toolchain_tool_securitycompliance" "scc_tool" {
  count        = (var.scc_enable_scc == true && var.enable_cos == true) ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    name                   = var.scc_integration_name
    evidence_namespace     = "cc"
    attachment_id          = var.scc_attachment_id
    instance_crn           = var.scc_instance_crn
    profile_name           = var.scc_profile_name
    profile_version        = var.scc_profile_version
    scc_api_key            = (var.scc_use_profile_attachment == "enabled") ? var.scc_scc_api_key_secret_ref : ""
    use_profile_attachment = var.scc_use_profile_attachment
    evidence_locker_type   = "evidence-bucket"
    cos_bucket_name        = (var.enable_cos == true && var.use_legacy_cos_tool == false) ? data.ibm_cd_toolchain_tool_cos.cos_tool_data[0].parameters[0].bucket_name : var.cos_bucket_name
  }
}

resource "ibm_cd_toolchain_tool_artifactory" "cd_toolchain_tool_artifactory_instance" {
  count = (var.enable_artifactory) ? 1 : 0

  parameters {
    name            = var.artifactory_integration_name
    dashboard_url   = var.artifactory_dashboard_url
    type            = "docker"
    user_id         = var.artifactory_user
    token           = var.artifactory_token_secret_ref
    repository_name = var.artifactory_repo_name
    repository_url  = var.artifactory_repo_url
  }
  toolchain_id = var.toolchain_id
}

resource "ibm_cd_toolchain_tool_privateworker" "cd_toolchain_tool_privateworker_instance" {
  count = (var.enable_privateworker) ? 1 : 0
  parameters {
    name                     = var.privateworker_name
    worker_queue_credentials = var.privateworker_credentials_secret_ref
  }
  toolchain_id = var.toolchain_id
}

resource "ibm_cd_toolchain_tool_eventnotifications" "cd_toolchain_tool_eventnotifications_instance" {
  count      = (var.event_notifications_crn != "") ? 1 : 0
  depends_on = [ibm_iam_authorization_policy.toolchain_event_notification_auth_policy]
  parameters {
    name         = var.event_notifications_tool_name
    instance_crn = var.event_notifications_crn
  }
  toolchain_id = var.toolchain_id
}

resource "ibm_cd_toolchain_tool_custom" "concert_integration" {
  count        = (var.enable_concert) ? 1 : 0
  toolchain_id = var.toolchain_id
  parameters {
    type              = "concert"
    lifecycle_phase   = "MANAGE"
    documentation_url = var.concert_documentation_url
    name              = var.concert_integration_name
    dashboard_url     = var.concert_dashboard_url
    description       = var.concert_description
  }
}
