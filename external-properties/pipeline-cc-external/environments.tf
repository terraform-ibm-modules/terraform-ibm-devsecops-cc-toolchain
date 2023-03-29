resource "ibm_cd_tekton_pipeline_property" "cc_pipeline_vault_secret_id" {
  name           = "vault_secret_id"
  type           = "secure"
  value          = "{vault::${var.secret_tool}.${var.vault_secret_id_secret_name}}"
  pipeline_id    = ibm_cd_tekton_pipeline.cc_pipeline_instance.pipeline_id
}
