####################################################################################
#
# IBM Kubernetes Services Details
#
####################################################################################

####################################################################################
#
# IBM Container Registry Services Details
#
####################################################################################

// Limitation with datasource: Cannot fetch registry namespaces for a specific region.
// Can only fetch registries in the region targeted for the provider.
# data "ibm_cr_namespaces" "registry_namespace" {}


####################################################################################
#
# IBM Key Protect Services Details
#
####################################################################################

data "ibm_resource_group" "sm_resource_group" {
  count = (var.enable_secrets_manager == true) && (var.sm_instance_crn == "") ? 1 : 0
  name  = var.sm_resource_group
}

data "ibm_resource_instance" "secrets_manager_instance" {
  count             = (var.enable_secrets_manager == true) && (var.sm_instance_crn == "") ? 1 : 0
  service           = "secrets-manager"
  name              = var.sm_name
  resource_group_id = data.ibm_resource_group.sm_resource_group[0].id
  location          = var.sm_location
}

data "ibm_resource_group" "kp_resource_group" {
  count = var.enable_key_protect ? 1 : 0
  name  = var.kp_resource_group
}
data "ibm_resource_instance" "key_protect_instance" {
  count             = var.enable_key_protect ? 1 : 0
  service           = "kms"
  name              = var.kp_name
  resource_group_id = data.ibm_resource_group.kp_resource_group[0].id
  location          = var.kp_location
}
