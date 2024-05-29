<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->
## Terraform IBM DevSecOps CC Toolchain
<!-- UPDATE BADGE: Update the link for the following badge-->

A Terraform module for provisioning the DevSecOps CC toolchains.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->


<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.60.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_repo"></a> [app\_repo](#module\_app\_repo) | ./repos | n/a |
| <a name="module_compliance_pipelines_repo"></a> [compliance\_pipelines\_repo](#module\_compliance\_pipelines\_repo) | ./repos | n/a |
| <a name="module_evidence_repo"></a> [evidence\_repo](#module\_evidence\_repo) | ./repos | n/a |
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_inventory_repo"></a> [inventory\_repo](#module\_inventory\_repo) | ./repos | n/a |
| <a name="module_issues_repo"></a> [issues\_repo](#module\_issues\_repo) | ./repos | n/a |
| <a name="module_pipeline_cc"></a> [pipeline\_cc](#module\_pipeline\_cc) | ./pipeline-cc | n/a |
| <a name="module_pipeline_config_repo"></a> [pipeline\_config\_repo](#module\_pipeline\_config\_repo) | ./repos | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./services | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/resources/cd_toolchain) | resource |
| [ibm_cd_toolchain_tool_pipeline.cc_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_group"></a> [app\_group](#input\_app\_group) | Specify Git user/group for app repo. | `string` | `""` | no |
| <a name="input_app_repo_auth_type"></a> [app\_repo\_auth\_type](#input\_app\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_app_repo_branch"></a> [app\_repo\_branch](#input\_app\_repo\_branch) | The default branch of the app repo. | `string` | `"master"` | no |
| <a name="input_app_repo_clone_to_git_id"></a> [app\_repo\_clone\_to\_git\_id](#input\_app\_repo\_clone\_to\_git\_id) | Custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_app_repo_clone_to_git_provider"></a> [app\_repo\_clone\_to\_git\_provider](#input\_app\_repo\_clone\_to\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `""` | no |
| <a name="input_app_repo_git_id"></a> [app\_repo\_git\_id](#input\_app\_repo\_git\_id) | The Git ID of the repository. | `string` | `""` | no |
| <a name="input_app_repo_git_provider"></a> [app\_repo\_git\_provider](#input\_app\_repo\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `"hostedgit"` | no |
| <a name="input_app_repo_git_token_secret_crn"></a> [app\_repo\_git\_token\_secret\_crn](#input\_app\_repo\_git\_token\_secret\_crn) | The CRN for the app repository Git Token. | `string` | `""` | no |
| <a name="input_app_repo_git_token_secret_name"></a> [app\_repo\_git\_token\_secret\_name](#input\_app\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_app_repo_initialization_type"></a> [app\_repo\_initialization\_type](#input\_app\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_app_repo_integration_owner"></a> [app\_repo\_integration\_owner](#input\_app\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_app_repo_is_private_repo"></a> [app\_repo\_is\_private\_repo](#input\_app\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_app_repo_issues_enabled"></a> [app\_repo\_issues\_enabled](#input\_app\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_app_repo_secret_group"></a> [app\_repo\_secret\_group](#input\_app\_repo\_secret\_group) | Secret group prefix for the App repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_app_repo_traceability_enabled"></a> [app\_repo\_traceability\_enabled](#input\_app\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_app_repo_url"></a> [app\_repo\_url](#input\_app\_repo\_url) | This Git URL for the application repository. | `string` | `""` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
| <a name="input_artifactory_integration_name"></a> [artifactory\_integration\_name](#input\_artifactory\_integration\_name) | The name of the Artifactory tool integration. | `string` | `"artifactory-dockerconfigjson"` | no |
| <a name="input_artifactory_repo_name"></a> [artifactory\_repo\_name](#input\_artifactory\_repo\_name) | Type the name of your Artifactory repository where your docker images are located. | `string` | `"wcp-compliance-automation-team-docker-local"` | no |
| <a name="input_artifactory_repo_url"></a> [artifactory\_repo\_url](#input\_artifactory\_repo\_url) | Type the URL for your Artifactory release repository. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_crn"></a> [artifactory\_token\_secret\_crn](#input\_artifactory\_token\_secret\_crn) | The CRN for the Artifactory secret. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_group"></a> [artifactory\_token\_secret\_group](#input\_artifactory\_token\_secret\_group) | Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_name"></a> [artifactory\_token\_secret\_name](#input\_artifactory\_token\_secret\_name) | Name of the artifactory token secret in the secret provider. | `string` | `"artifactory-token"` | no |
| <a name="input_artifactory_user"></a> [artifactory\_user](#input\_artifactory\_user) | Type the User ID or email for your Artifactory repository. | `string` | `""` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Set to disabled if you do not want this policy auto created. | `string` | `""` | no |
| <a name="input_compliance_base_image"></a> [compliance\_base\_image](#input\_compliance\_base\_image) | Pipeline baseimage to run most of the built-in pipeline code. | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify Git user/group for compliance pipline repo. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance\_pipeline\_repo\_git\_provider](#input\_compliance\_pipeline\_repo\_git\_provider) | Choose the default git provider for change management repo | `string` | `"hostedgit"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_crn"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_crn](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_crn) | The CRN for the Compliance Pipeline repository Git Token. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_compliance_pipeline_repo_integration_owner"></a> [compliance\_pipeline\_repo\_integration\_owner](#input\_compliance\_pipeline\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_issues_enabled"></a> [compliance\_pipeline\_repo\_issues\_enabled](#input\_compliance\_pipeline\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_compliance_pipeline_repo_secret_group"></a> [compliance\_pipeline\_repo\_secret\_group](#input\_compliance\_pipeline\_repo\_secret\_group) | Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_url"></a> [compliance\_pipeline\_repo\_url](#input\_compliance\_pipeline\_repo\_url) | Url of pipeline repo template to be cloned | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_git_id"></a> [compliance\_pipelines\_repo\_git\_id](#input\_compliance\_pipelines\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_crn"></a> [cos\_api\_key\_secret\_crn](#input\_cos\_api\_key\_secret\_crn) | The CRN for the Cloud Object Storage apikey. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_group"></a> [cos\_api\_key\_secret\_group](#input\_cos\_api\_key\_secret\_group) | Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | COS API key | `string` | `"cos-api-key"` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | COS bucket name. | `string` | `""` | no |
| <a name="input_cos_dashboard_url"></a> [cos\_dashboard\_url](#input\_cos\_dashboard\_url) | The dashboard URL for the COS toolcard. | `string` | `"https://cloud.ibm.com/catalog/services/cloud-object-storage"` | no |
| <a name="input_cos_description"></a> [cos\_description](#input\_cos\_description) | The COS description on the tool card. | `string` | `"Cloud Object Storage to store evidences within DevSecOps Pipelines"` | no |
| <a name="input_cos_documentation_url"></a> [cos\_documentation\_url](#input\_cos\_documentation\_url) | The documentation URL that appears on the tool card. | `string` | `"https://cloud.ibm.com/catalog/services/cloud-object-storage"` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | COS endpoint name. | `string` | `""` | no |
| <a name="input_cos_integration_name"></a> [cos\_integration\_name](#input\_cos\_integration\_name) | The name of the COS integration. | `string` | `"Evidence Store"` | no |
| <a name="input_cra_bom_generate"></a> [cra\_bom\_generate](#input\_cra\_bom\_generate) | Set this flag to `1` to generate cra bom | `string` | `"1"` | no |
| <a name="input_cra_deploy_analysis"></a> [cra\_deploy\_analysis](#input\_cra\_deploy\_analysis) | Set this flag to `1` for cra deployment analysis to be done. | `string` | `"1"` | no |
| <a name="input_cra_vulnerability_scan"></a> [cra\_vulnerability\_scan](#input\_cra\_vulnerability\_scan) | Set this flag to `1` and `cra-bom-generate` to `1` for cra vulnerability scan.  If this value is set to 1 and `cra-bom-generate` is set to 0, the scan will be marked as `failure` | `string` | `"1"` | no |
| <a name="input_default_git_provider"></a> [default\_git\_provider](#input\_default\_git\_provider) | Choose the default git provider for app repo | `string` | `"hostedgit"` | no |
| <a name="input_doi_environment"></a> [doi\_environment](#input\_doi\_environment) | DevOps Insights environment for DevSecOps CD deployment. | `string` | `""` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOps Insights Toolchain ID to link to. | `string` | `""` | no |
| <a name="input_enable_artifactory"></a> [enable\_artifactory](#input\_enable\_artifactory) | Set true to enable artifacory for devsecops. | `bool` | `false` | no |
| <a name="input_enable_insights"></a> [enable\_insights](#input\_enable\_insights) | Set to `true` to enable the DevOps Insights integration. | `bool` | `true` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_dockerconfigjson"></a> [enable\_pipeline\_dockerconfigjson](#input\_enable\_pipeline\_dockerconfigjson) | Enable to add the pipeline-dockerconfigjson to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_pipeline_git_token"></a> [enable\_pipeline\_git\_token](#input\_enable\_pipeline\_git\_token) | Enable to add `git-token` to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_pipeline_notifications"></a> [enable\_pipeline\_notifications](#input\_enable\_pipeline\_notifications) | When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration. | `bool` | `false` | no |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Tag name that represents the target environment in the inventory. Example: prod\_latest. | `string` | `"prod_latest"` | no |
| <a name="input_event_notifications"></a> [event\_notifications](#input\_event\_notifications) | To enable event notification, set event\_notifications to 1 | `string` | `"0"` | no |
| <a name="input_event_notifications_crn"></a> [event\_notifications\_crn](#input\_event\_notifications\_crn) | The CRN for the Event Notifications instance. | `string` | `""` | no |
| <a name="input_event_notifications_tool_name"></a> [event\_notifications\_tool\_name](#input\_event\_notifications\_tool\_name) | The name of the Event Notifications integration. | `string` | `"Event Notifications"` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repo. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#input\_evidence\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_crn"></a> [evidence\_repo\_git\_token\_secret\_crn](#input\_evidence\_repo\_git\_token\_secret\_crn) | The CRN for the Evidence repository Git Token. | `string` | `""` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_repo_initialization_type"></a> [evidence\_repo\_initialization\_type](#input\_evidence\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_evidence_repo_integration_owner"></a> [evidence\_repo\_integration\_owner](#input\_evidence\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_evidence_repo_is_private_repo"></a> [evidence\_repo\_is\_private\_repo](#input\_evidence\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_evidence_repo_issues_enabled"></a> [evidence\_repo\_issues\_enabled](#input\_evidence\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_evidence_repo_name"></a> [evidence\_repo\_name](#input\_evidence\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_evidence_repo_secret_group"></a> [evidence\_repo\_secret\_group](#input\_evidence\_repo\_secret\_group) | Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_evidence_repo_traceability_enabled"></a> [evidence\_repo\_traceability\_enabled](#input\_evidence\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_evidence_repo_url"></a> [evidence\_repo\_url](#input\_evidence\_repo\_url) | This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates. | `string` | `""` | yes |
| <a name="input_gosec_private_repository_host"></a> [gosec\_private\_repository\_host](#input\_gosec\_private\_repository\_host) | Your private repository base URL. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_crn"></a> [gosec\_private\_repository\_ssh\_key\_secret\_crn](#input\_gosec\_private\_repository\_ssh\_key\_secret\_crn) | The CRN for the Deployment repository Git Token. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_group"></a> [gosec\_private\_repository\_ssh\_key\_secret\_group](#input\_gosec\_private\_repository\_ssh\_key\_secret\_group) | Secret group prefix for the Gosec private repository ssh key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_name"></a> [gosec\_private\_repository\_ssh\_key\_secret\_name](#input\_gosec\_private\_repository\_ssh\_key\_secret\_name) | Name of the SSH key token for the private repository in the secret provider. | `string` | `"git-ssh-key"` | no |
| <a name="input_ibmcloud_api"></a> [ibmcloud\_api](#input\_ibmcloud\_api) | IBM Cloud API Endpoint. | `string` | `"https://cloud.ibm.com"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchains. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repo. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#input\_inventory\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_crn"></a> [inventory\_repo\_git\_token\_secret\_crn](#input\_inventory\_repo\_git\_token\_secret\_crn) | The CRN for the Inventory repository Git Token. | `string` | `""` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_repo_initialization_type"></a> [inventory\_repo\_initialization\_type](#input\_inventory\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_inventory_repo_integration_owner"></a> [inventory\_repo\_integration\_owner](#input\_inventory\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_inventory_repo_is_private_repo"></a> [inventory\_repo\_is\_private\_repo](#input\_inventory\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_inventory_repo_issues_enabled"></a> [inventory\_repo\_issues\_enabled](#input\_inventory\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_inventory_repo_name"></a> [inventory\_repo\_name](#input\_inventory\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_inventory_repo_secret_group"></a> [inventory\_repo\_secret\_group](#input\_inventory\_repo\_secret\_group) | Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_inventory_repo_traceability_enabled"></a> [inventory\_repo\_traceability\_enabled](#input\_inventory\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_inventory_repo_url"></a> [inventory\_repo\_url](#input\_inventory\_repo\_url) | This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates. | `string` | `""` | yes |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repo. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_issues_repo_git_id"></a> [issues\_repo\_git\_id](#input\_issues\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_crn"></a> [issues\_repo\_git\_token\_secret\_crn](#input\_issues\_repo\_git\_token\_secret\_crn) | The CRN for the Issues repository Git Token. | `string` | `""` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_repo_initialization_type"></a> [issues\_repo\_initialization\_type](#input\_issues\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_issues_repo_integration_owner"></a> [issues\_repo\_integration\_owner](#input\_issues\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_issues_repo_is_private_repo"></a> [issues\_repo\_is\_private\_repo](#input\_issues\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_issues_repo_issues_enabled"></a> [issues\_repo\_issues\_enabled](#input\_issues\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_issues_repo_name"></a> [issues\_repo\_name](#input\_issues\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_issues_repo_secret_group"></a> [issues\_repo\_secret\_group](#input\_issues\_repo\_secret\_group) | Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_issues_repo_traceability_enabled"></a> [issues\_repo\_traceability\_enabled](#input\_issues\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_issues_repo_url"></a> [issues\_repo\_url](#input\_issues\_repo\_url) | This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates. | `string` | `""` | yes |
| <a name="input_kp_integration_name"></a> [kp\_integration\_name](#input\_kp\_integration\_name) | The name of the Key Protect integration. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `"us-south"` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance for your secrets. | `string` | `"Default"` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOps Insights instance in another toolchain, true or false. | `bool` | `false` | no |
| <a name="input_opt_in_auto_close"></a> [opt\_in\_auto\_close](#input\_opt\_in\_auto\_close) | Enables auto-closing of issues coming from vulnerabilities, once the vulnerability is no longer detected by the CC pipeline run. | `string` | `"1"` | no |
| <a name="input_opt_in_dynamic_api_scan"></a> [opt\_in\_dynamic\_api\_scan](#input\_opt\_in\_dynamic\_api\_scan) | To enable the OWASP Zap API scan. '1' enable or '0' disable. | `string` | `""` | no |
| <a name="input_opt_in_dynamic_scan"></a> [opt\_in\_dynamic\_scan](#input\_opt\_in\_dynamic\_scan) | To enable the OWASP Zap scan. '1' enable or '0' disable. | `string` | `""` | no |
| <a name="input_opt_in_dynamic_ui_scan"></a> [opt\_in\_dynamic\_ui\_scan](#input\_opt\_in\_dynamic\_ui\_scan) | To enable the OWASP Zap UI scan. '1' enable or '0' disable. | `string` | `""` | no |
| <a name="input_opt_in_gosec"></a> [opt\_in\_gosec](#input\_opt\_in\_gosec) | Enables Gosec scans | `string` | `""` | no |
| <a name="input_peer_review_compliance"></a> [peer\_review\_compliance](#input\_peer\_review\_compliance) | Set to `1` to enable peer review. | `string` | `"1"` | no |
| <a name="input_pipeline_branch"></a> [pipeline\_branch](#input\_pipeline\_branch) | The branch within pipeline definitions repository for Compliance CC Toolchain. | `string` | `"open-v10"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify Git user/group for pipeline config repo. | `string` | `""` | no |
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config repo. | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify a branch of a repository to clone that contains a custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository to clone that contains a custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_id"></a> [pipeline\_config\_repo\_git\_id](#input\_pipeline\_config\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#input\_pipeline\_config\_repo\_git\_provider) | Git provider for pipeline repo config | `string` | `"hostedgit"` | no |
| <a name="input_pipeline_config_repo_git_token_secret_crn"></a> [pipeline\_config\_repo\_git\_token\_secret\_crn](#input\_pipeline\_config\_repo\_git\_token\_secret\_crn) | The CRN for the Pipeline Config repository Git Token. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_config_repo_initialization_type"></a> [pipeline\_config\_repo\_initialization\_type](#input\_pipeline\_config\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_integration_owner"></a> [pipeline\_config\_repo\_integration\_owner](#input\_pipeline\_config\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_is_private_repo"></a> [pipeline\_config\_repo\_is\_private\_repo](#input\_pipeline\_config\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_pipeline_config_repo_issues_enabled"></a> [pipeline\_config\_repo\_issues\_enabled](#input\_pipeline\_config\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_pipeline_config_repo_name"></a> [pipeline\_config\_repo\_name](#input\_pipeline\_config\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_secret_group"></a> [pipeline\_config\_repo\_secret\_group](#input\_pipeline\_config\_repo\_secret\_group) | Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_traceability_enabled"></a> [pipeline\_config\_repo\_traceability\_enabled](#input\_pipeline\_config\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | Set to '1' to enable debug logging. | `string` | `"0"` | no |
| <a name="input_pipeline_dockerconfigjson_secret_crn"></a> [pipeline\_dockerconfigjson\_secret\_crn](#input\_pipeline\_dockerconfigjson\_secret\_crn) | The CRN for the Dockerconfig json secret. | `string` | `""` | no |
| <a name="input_pipeline_dockerconfigjson_secret_group"></a> [pipeline\_dockerconfigjson\_secret\_group](#input\_pipeline\_dockerconfigjson\_secret\_group) | Secret group prefix for the pipeline DockerConfigJson secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_dockerconfigjson_secret_name"></a> [pipeline\_dockerconfigjson\_secret\_name](#input\_pipeline\_dockerconfigjson\_secret\_name) | Name of the dockerconfigjson secret in the secret provider. | `string` | `"pipeline-dockerconfigjson"` | no |
| <a name="input_pipeline_doi_api_key_secret_crn"></a> [pipeline\_doi\_api\_key\_secret\_crn](#input\_pipeline\_doi\_api\_key\_secret\_crn) | The CRN for the pipeline DOI apikey. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_group"></a> [pipeline\_doi\_api\_key\_secret\_group](#input\_pipeline\_doi\_api\_key\_secret\_group) | Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_name"></a> [pipeline\_doi\_api\_key\_secret\_name](#input\_pipeline\_doi\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance. | `string` | `""` | no |
| <a name="input_pipeline_git_tag"></a> [pipeline\_git\_tag](#input\_pipeline\_git\_tag) | The GIT tag within the CC pipeline definitions repository for Compliance CC Toolchain. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_crn"></a> [pipeline\_git\_token\_secret\_crn](#input\_pipeline\_git\_token\_secret\_crn) | The CRN for pipeline Git token property. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_group"></a> [pipeline\_git\_token\_secret\_group](#input\_pipeline\_git\_token\_secret\_group) | Secret group prefix for the pipeline Git token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_name"></a> [pipeline\_git\_token\_secret\_name](#input\_pipeline\_git\_token\_secret\_name) | Name of the pipeline Git token secret in the secret provider. | `string` | `"pipeline-git-token"` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_crn"></a> [pipeline\_ibmcloud\_api\_key\_secret\_crn](#input\_pipeline\_ibmcloud\_api\_key\_secret\_crn) | The CRN for the IBMCloud apikey. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_group"></a> [pipeline\_ibmcloud\_api\_key\_secret\_group](#input\_pipeline\_ibmcloud\_api\_key\_secret\_group) | Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_scc_attachment_id"></a> [scc\_attachment\_id](#input\_scc\_attachment\_id) | An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_enable_scc"></a> [scc\_enable\_scc](#input\_scc\_enable\_scc) | Enable the SCC integration. | `bool` | `true` | no |
| <a name="input_scc_instance_crn"></a> [scc\_instance\_crn](#input\_scc\_instance\_crn) | The Security and Compliance Center service instance CRN (Cloud Resource Name). This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. The value must match the regular expression. | `string` | `""` | no |
| <a name="input_scc_integration_name"></a> [scc\_integration\_name](#input\_scc\_integration\_name) | The name of the SCC integration name. | `string` | `"Security and Compliance"` | no |
| <a name="input_scc_profile_name"></a> [scc\_profile\_name](#input\_scc\_profile\_name) | The name of a Security and Compliance Center profile. Use the `IBM Cloud Framework for Financial Services` profile, which contains the DevSecOps Toolchain rules. Or use a user-authored customized profile that has been configured to contain those rules. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_profile_version"></a> [scc\_profile\_version](#input\_scc\_profile\_version) | The version of a Security and Compliance Center profile, in SemVer format, like `0.0.0`. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_crn"></a> [scc\_scc\_api\_key\_secret\_crn](#input\_scc\_scc\_api\_key\_secret\_crn) | The CRN for SCC apikey. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_group"></a> [scc\_scc\_api\_key\_secret\_group](#input\_scc\_scc\_api\_key\_secret\_group) | Secret group prefix for the Security and Compliance tool secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_name"></a> [scc\_scc\_api\_key\_secret\_name](#input\_scc\_scc\_api\_key\_secret\_name) | The Security and Compliance Center api-key secret in the secret provider. | `string` | `"scc-api-key"` | no |
| <a name="input_scc_use_profile_attachment"></a> [scc\_use\_profile\_attachment](#input\_scc\_use\_profile\_attachment) | Set to `enabled` to enable use profile with attachment, so that the scripts in the pipeline can interact with the Security and Compliance Center service. When enabled, other parameters become relevant; `scc_scc_scc_api_key_secret_name`, `scc_instance_crn`, `scc_profile_name`, `scc_profile_version`, `scc_attachment_id`. | `string` | `"disabled"` | no |
| <a name="input_slack_channel_name"></a> [slack\_channel\_name](#input\_slack\_channel\_name) | The Slack channel that notifications will be posted to. | `string` | `"my-channel"` | no |
| <a name="input_slack_integration_name"></a> [slack\_integration\_name](#input\_slack\_integration\_name) | The name of the Slack integration. | `string` | `"slack-compliance"` | no |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | The switch that turns the Slack integration on or off. | `string` | `"0"` | no |
| <a name="input_slack_pipeline_fail"></a> [slack\_pipeline\_fail](#input\_slack\_pipeline\_fail) | Generate pipeline failed notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_start"></a> [slack\_pipeline\_start](#input\_slack\_pipeline\_start) | Generate pipeline start notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_success"></a> [slack\_pipeline\_success](#input\_slack\_pipeline\_success) | Generate pipeline succeeded notifications. | `bool` | `true` | no |
| <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name) | The Slack team name, which is the word or phrase before .slack.com in the team URL. | `string` | `"my-team"` | no |
| <a name="input_slack_toolchain_bind"></a> [slack\_toolchain\_bind](#input\_slack\_toolchain\_bind) | Generate tool added to toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_toolchain_unbind"></a> [slack\_toolchain\_unbind](#input\_slack\_toolchain\_unbind) | Generate tool removed from toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_webhook_secret_crn"></a> [slack\_webhook\_secret\_crn](#input\_slack\_webhook\_secret\_crn) | The CRN for Slack Webhook secret. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_group"></a> [slack\_webhook\_secret\_group](#input\_slack\_webhook\_secret\_group) | Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_instance_crn"></a> [sm\_instance\_crn](#input\_sm\_instance\_crn) | The CRN of the Secrets Manager instance. | `string` | `""` | no |
| <a name="input_sm_integration_name"></a> [sm\_integration\_name](#input\_sm\_integration\_name) | The name of the Secrets Manager integration. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance. | `string` | `"us-south"` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. Not required if using a Secrets Manager CRN instance. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance for your secrets. Not required if using a Secrets Manager CRN instance. | `string` | `"Default"` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | Group in Secrets Manager for organizing/grouping secrets. | `string` | `"Default"` | no |
| <a name="input_sonarqube_config"></a> [sonarqube\_config](#input\_sonarqube\_config) | Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. Default is default. | `string` | `"default"` | no |
| <a name="input_sonarqube_integration_name"></a> [sonarqube\_integration\_name](#input\_sonarqube\_integration\_name) | The name of the SonarQube integration. | `string` | `"SonarQube"` | no |
| <a name="input_sonarqube_is_blind_connection"></a> [sonarqube\_is\_blind\_connection](#input\_sonarqube\_is\_blind\_connection) | When set to `true`, instructs IBM Cloud Continuous Delivery to not validate the configuration of this integration. Set this to true if the SonarQube server is not addressable on the public internet. | `string` | `true` | no |
| <a name="input_sonarqube_secret_crn"></a> [sonarqube\_secret\_crn](#input\_sonarqube\_secret\_crn) | The CRN for the SonarQube secret. | `string` | `""` | no |
| <a name="input_sonarqube_secret_group"></a> [sonarqube\_secret\_group](#input\_sonarqube\_secret\_group) | Secret group prefix for the SonarQube secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_sonarqube_secret_name"></a> [sonarqube\_secret\_name](#input\_sonarqube\_secret\_name) | The name of the SonarQube secret. | `string` | `"sonarqube-secret"` | no |
| <a name="input_sonarqube_server_url"></a> [sonarqube\_server\_url](#input\_sonarqube\_server\_url) | The URL to the SonarQube server. | `string` | `""` | no |
| <a name="input_sonarqube_user"></a> [sonarqube\_user](#input\_sonarqube\_user) | The name of the SonarQube user. | `string` | `""` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CC Toolchain. | `string` | `"Toolchain created with terraform template for DevSecOps CC Best Practices"` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of the CC Toolchain. | `string` | `"DevSecOps CC Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud region where the toolchain is created | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | Resource group within which the toolchain is created | `string` | `"Default"` | no |
| <a name="input_trigger_manual_enable"></a> [trigger\_manual\_enable](#input\_trigger\_manual\_enable) | Set to `true` to enable the CC pipeline Manual trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_name"></a> [trigger\_manual\_name](#input\_trigger\_manual\_name) | The name of the CC pipeline Manual trigger. | `string` | `"CC Manual Trigger"` | no |
| <a name="input_trigger_manual_pruner_enable"></a> [trigger\_manual\_pruner\_enable](#input\_trigger\_manual\_pruner\_enable) | Set to `true` to enable the manual Pruner trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_pruner_name"></a> [trigger\_manual\_pruner\_name](#input\_trigger\_manual\_pruner\_name) | The name of the manual Pruner trigger. | `string` | `"Evidence Pruner Manual Trigger"` | no |
| <a name="input_trigger_timed_cron_schedule"></a> [trigger\_timed\_cron\_schedule](#input\_trigger\_timed\_cron\_schedule) | Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *\_/2 * * * - every 2 hours. | `string` | `"0 4 * * *"` | no |
| <a name="input_trigger_timed_enable"></a> [trigger\_timed\_enable](#input\_trigger\_timed\_enable) | Set to `true` to enable the CI pipeline Timed trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_name"></a> [trigger\_timed\_name](#input\_trigger\_timed\_name) | The name of the CC pipeline Timed trigger. | `string` | `"CC Timed Trigger"` | no |
| <a name="input_trigger_timed_pruner_enable"></a> [trigger\_timed\_pruner\_enable](#input\_trigger\_timed\_pruner\_enable) | Set to `true` to enable the timed Pruner trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_pruner_name"></a> [trigger\_timed\_pruner\_name](#input\_trigger\_timed\_pruner\_name) | The name of the timed Pruner trigger. | `string` | `"Evidence Pruner Timed Trigger"` | no |
| <a name="input_worker_id"></a> [worker\_id](#input\_worker\_id) | The identifier for the Managed Pipeline worker. | `string` | `"public"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_repo"></a> [app\_repo](#output\_app\_repo) | The Application repo. |
| <a name="output_app_repo_url"></a> [app\_repo\_url](#output\_app\_repo\_url) | The app repository instance URL containing an application that can be built and deployed with the reference DevSecOps toolchain templates. |
| <a name="output_cc_pipeline_id"></a> [cc\_pipeline\_id](#output\_cc\_pipeline\_id) | The CC pipeline ID. |
| <a name="output_evidence_repo"></a> [evidence\_repo](#output\_evidence\_repo) | The Evidence repo. |
| <a name="output_evidence_repo_url"></a> [evidence\_repo\_url](#output\_evidence\_repo\_url) | The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit. |
| <a name="output_inventory_repo"></a> [inventory\_repo](#output\_inventory\_repo) | The Inventory repo. |
| <a name="output_inventory_repo_url"></a> [inventory\_repo\_url](#output\_inventory\_repo\_url) | The inventory repository instance URL, with details of which artifact has been built and will be deployed. |
| <a name="output_issues_repo"></a> [issues\_repo](#output\_issues\_repo) | The Issues repo. |
| <a name="output_issues_repo_url"></a> [issues\_repo\_url](#output\_issues\_repo\_url) | The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected. |
| <a name="output_key_protect_instance_id"></a> [key\_protect\_instance\_id](#output\_key\_protect\_instance\_id) | The Key Protect instance ID. |
| <a name="output_pipeline_repo_url"></a> [pipeline\_repo\_url](#output\_pipeline\_repo\_url) | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_secrets_manager_instance_id"></a> [secrets\_manager\_instance\_id](#output\_secrets\_manager\_instance\_id) | The Secrets Manager instance ID. |
| <a name="output_toolchain_id"></a> [toolchain\_id](#output\_toolchain\_id) | The CC toolchain ID. |
| <a name="output_toolchain_url"></a> [toolchain\_url](#output\_toolchain\_url) | The CC toolchain URL. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
