##############################################################################
# Outputs
##############################################################################

output "kp_instance_guid" {
  value       = try(data.ibm_resource_instance.key_protect_instance[0].guid, "")
  description = "GUID of the Key Protect service instance in IBM Cloud"
}
