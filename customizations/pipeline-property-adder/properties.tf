locals {

  # Adding pipeline_id and property_name to generate a unique map key
  pre_process_property_data = flatten([for prop in var.property_data.properties : {
    pipeline_id = var.property_data.pipeline_id
    property    = prop
    prop_name   = prop.name
    config_data = var.config_data
    }
  ])
}


# This is the property structure being passed with each loop
# into `property_data`. It is expected for `repositories` to contain repo data
#  {
#    "name": "param1",
#    "type": "text",
#    "value": "example1"
#    "enum": "[0,1]"
#  }

module "property" {
  source = "../properties"
  for_each = tomap({
    for t in local.pre_process_property_data : "${t.pipeline_id}-${t.prop_name}" => t
  })
  property_data = each.value
  pipeline_id   = var.pipeline_id
}
