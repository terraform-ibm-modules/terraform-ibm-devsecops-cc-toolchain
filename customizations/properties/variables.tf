variable "pipeline_id" {
  type        = string
  description = "The ID of the pipeline to which properties are attached."
  default     = ""
}

variable "trigger_id" {
  type        = string
  description = "The ID of the targeted trigger."
  default     = ""
}

variable "is_trigger_property" {
  type        = bool
  description = "Set to `true` to flag the property as a trigger property, as opposed to a pipeline property."
  default     = false
}

variable "property_data" {
  description = "The JSON payload containing containing the property data."
}
