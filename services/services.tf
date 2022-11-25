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
  name = var.sm_resource_group
}

data ibm_resource_instance "secrets_manager_instance" {
  service           = "secrets-manager"
  name              = var.sm_name
  resource_group_id = data.ibm_resource_group.sm_resource_group.id
  location          = var.sm_location
}

output "sm_instance_guid" {
  value = data.ibm_resource_instance.secrets_manager_instance.guid
  description = "GUID of the Secrets Manager service instance in IBM Cloud"
}