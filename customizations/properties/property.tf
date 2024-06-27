
# NOTE: handles both pipeline properties and trigger properties. The specification is very similar.
# The difference being:
# 1) `ibm_cd_tekton_pipeline_property` vs `ibm_cd_tekton_pipeline_trigger_property`
# 2) Trigger properties additionally require `trigger_id` to be set

# TYPES
# enum -> only used when type is set to single_select
# name -> max length = 253 chars, allowed characters = /^[-0-9a-zA-Z_.]{1,253}$/
# path -> min length =0, max length = 4096, allowed characters = /^[-0-9a-zA-Z_.]*$/
# pipeline_id -> max length = 36, allowed characters = /^[-0-9a-z]+$/
# type -> allowed options = secure, text, single_select, integration, appconfig
# locked -> true or false (default false)

locals {

  #TODO Validate all the values before attempting to create the property. Raise an alert if there is a problem
  input_target     = try(var.property_data.property.target, "")
  input_name       = try(var.property_data.property.name, "")
  input_type       = try(var.property_data.property.type, "text")
  input_value      = try(var.property_data.property.value, "")
  input_path       = (local.input_type == "integration") ? try(var.property_data.property.path, null) : null
  input_enum       = try(jsondecode(var.property_data.property.enum), null)
  input_locked     = try(var.property_data.property.locked, "false")
  input_trigger_id = try(var.trigger_id, "")

  secrets_integration_name = try(var.property_data.config_data.secrets_integration_name, "")
  secrets_group            = try(var.property_data.config_data.secrets_group, "")
  secrets_provider_type    = try(var.property_data.config_data.secrets_provider_type, "")

  #build up secret reference
  secret_ref_prefix = (
    (local.secrets_provider_type == "kp") ? "{vault::${local.secrets_integration_name}." :
    (local.secrets_provider_type == "sm") ? "{vault::${local.secrets_integration_name}.${local.secrets_group}." : ""
  )

  #check if provided secret contains the full ref
  is_secret_ref = ((startswith(local.input_value, "{vault::")) || (startswith(local.input_value, "crn:")) || (startswith(local.input_value, "ref://"))) ? true : false

  secret_ref = (
    ((local.input_type == "secure") && (local.is_secret_ref == true)) ? local.input_value :
    (local.input_type == "secure") ? "${local.secret_ref_prefix}${local.input_value}}" : local.input_value
  )

  input_repository_integration_id = (local.input_value == "") ? try(var.property_data.repository_integration_id, "") : local.input_value

  resolved_value = ((local.input_type == "integration") && (local.input_value == "")) ? local.input_repository_integration_id : local.secret_ref
  resolved_path  = ((local.input_type == "integration") && (local.input_value == "") && (local.input_path == null)) ? "parameters.repo_url" : null

  #is_valid_type = (local.input_type == "secure" || local.input_type == "text" || local.input_type == "single_select" || local.input_type == "integration" || local.input_type == "appconfig") ? true : false
  #is_name_valid = ((length(local.input_name) > 0) && (length(local.input_name) < 254)) ? true : false
  #is_enum = (
  #  ((local.input_type == "single_select") && (local.input_enum != null)) ? true :
  #  ((local.input_type != "single_select") && (local.input_enum == null)) ? true : false
  #)

  #add_property = ((local.is_valid_type == true) && (local.is_name_valid == true) && (local.is_enum == true))
  resolved_locked = ((local.input_locked == "true") || (local.input_locked == "false")) ? local.input_locked : "false"
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_property" {
  count       = (var.is_trigger_property == false) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = local.input_name
  type        = local.input_type
  value       = local.resolved_value
  path        = local.resolved_path
  enum        = local.input_enum
  locked      = local.resolved_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property" {
  count       = (var.is_trigger_property == true) ? 1 : 0
  pipeline_id = var.pipeline_id
  name        = local.input_name
  type        = local.input_type
  value       = local.resolved_value
  path        = local.resolved_path
  enum        = local.input_enum
  trigger_id  = local.input_trigger_id
  locked      = local.resolved_locked
}
