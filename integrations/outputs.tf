##############################################################################
# Outputs
##############################################################################

output "ibm_cd_toolchain_tool_artifactory" {
  value = (var.enable_artifactory) ? ibm_cd_toolchain_tool_artifactory.cd_toolchain_tool_artifactory_instance[0].tool_id : null
}

output "secret_tool" {
  value = (var.enable_key_protect) ? local.kp_integration_name : local.sm_integration_name
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

output "sonarqube_tool" {
  value = (var.sonarqube_config == "custom") ? ibm_cd_toolchain_tool_sonarqube.cd_toolchain_tool_sonarqube_instance[0].tool_id : null
}