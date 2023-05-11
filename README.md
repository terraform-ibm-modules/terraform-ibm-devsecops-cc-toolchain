<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->

# Terraform IBM DevSecOps CC Toolchain

<!-- UPDATE BADGE: Update the link for the following badge-->

A Terraform module for provisioning the DevSecOps CC toolchains.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->
<!-- END MODULE HOOK -->
<!-- BEGIN EXAMPLES HOOK -->

## Setup Terraform

#### Terraform CLI Installation

The Terraform CLI is a command line application from HashiCorp that is required to run the different Terraform commands.

##### MacOS

Run the following to install the Hashicorp repository of Homebrew packages

- brew tap hashicorp/tap

- brew install hashicorp/tap/terraform

##### RHEL/yum

- sudo yum install -y yum-utils
- sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo

- yum install terraform

##### Ubuntu

- sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

- wget -O- https://apt.releases.hashicorp.com/gpg | \
   gpg --dearmor | \
   sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

- gpg --no-default-keyring \
   --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
   --fingerprint

- echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
   https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
   sudo tee /etc/apt/sources.list.d/hashicorp.list

- sudo apt update

- sudo apt-get install terraform

##### Verify Installation

Run `terraform -help`

##### Other Platforms

For additional platforms please see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### Terraform Commands (basic)

1. `terraform init` - this command initialises the working directory containing the Terraform configuration files
2. `terraform plan` - a command that provides a preview of the actions that Terraform will perform on your infrastructure.
3. `terraform apply` - the command to perform the infrastructure modifications outlined using the plan command.
4. `terraform destroy` - the command to delete all the resources managed by the Terraform project.
5. `terraform help` - lists and describes Terraform CLI commands

## Usage

[Required IAM access policies](#iamaccess) sections

### <a id="prerequisites"></a>Prerequisites

#### IBM Cloud account

Set up an [IBM Cloud account](https://cloud.ibm.com/registration). Depending on your IBM Cloud account type, access to certain resources might be limited. Depending on your account plan limits, certain capabilities that are required by some DevSecOps toolchains might not be available. For more information, see [Setting up your IBM Cloud account](https://cloud.ibm.com/docs/account?topic=account-account-getting-started) and [Upgrading your account](https://cloud.ibm.com/docs/account?topic=account-upgrading-account).

#### Continuous Delivery Service.

This is the service underpinning the repositories and pipelines in the toolchain. While the toolchains can be created without this service, they are highly restricted. See [Continuous Delivery](https://cloud.ibm.com/catalog/services/continuous-delivery)

#### Secrets Management Vault

Ensure that all of the secret values that you need are stored in a secrets management vault. [Managing IBM Cloud secrets](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-manage-secrets-ibm-cloud) can help you to choose from various secrets management and data protection offerings. If you don't already have an instance of the secrets management vault provider of your choice, create one. For information about IBM Cloud® Secrets Manager, see [Getting started with Secrets Manager](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-getting-started).

#### Kubernetes cluster

Create a [Kubernetes cluster](https://cloud.ibm.com/kubernetes/catalog/cluster/create). While you are evaluating the service, you can use the Free pricing plan. The cluster might take some time to provision. As the cluster is created, it progresses through these stages: Deploying, Pending, and Ready. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### Container Registry namespace

Create an [IBM Cloud® Container Registry namespace](https://cloud.ibm.com/registry/namespaces). IBM Cloud Container Registry provides a multi-tenant private image registry that you can use to store and share your container images with users in your IBM Cloud account. Select the location for your namespace, and click Create. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### IBM Cloud API key

Create an [IBM Cloud API key](https://cloud.ibm.com/iam/apikeys). Save the API key value by either copying, downloading it or adding it to your vault.

#### IBM Cloud Object Storage (Optional)

Create an [IBM Cloud Object Storage instance and bucket](https://cloud.ibm.com/docs/devsecops?topic=devsecops-cd-devsecops-cos-config). [Learn more](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-about-cloud-object-storage).

### Setup

The following steps create the out of the box setup for the CC Toolchains. Read through the example .tfvars file for a quick set up and see the [inputs](#inputs) for all modifiable settings.

- Clone this [repo](https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-alm) to a local directory
- `cd` into the cloned directory
- Run `terraform init` to download the required modules and plugins
- Supply a `terraform.tfvars` file with the required variables. See the provided example at the root of the repo
- Rename the `variables.tfvars.example` to `variables.tfvars`
- The snippet below shows the minumum required details to set up the CC toolchains. Read the notes in the sample tfvars file for more details
- Run `terraform plan -var-files 'path-to-variables.tfvars'` to generate a plan and check to for potential problems
- Run `terraform apply -var-files 'path-to-variables.tfvars'` to execute the Terraform commands

After a successful Terraform run, login into [IBM Cloud](https://cloud.ibm.com/) and look at the [Toolchains](https://cloud.ibm.com/devops/toolchains?env_id=ibm:yp:us-south) section to find your newly created DevSecOps toolchains.

```hcl
ibmcloud_api_key          = "{set your ibmcloud apikey}"
toolchain_region          = "us-south"
toolchain_name            = "DevSecOps CC Toolchain - Terraform"
pipeline_repo             = "https://us-south.git.cloud.ibm.com/open-toolchain/compliance-pipelines"
evidence_repo_url         = "https://us-south.git.cloud.ibm.com/{namespace}/{evidence_repo}"
inventory_repo_url        = "https://us-south.git.cloud.ibm.com/{namespace}/{inventory_repo}"
issues_repo_url           = "https://us-south.git.cloud.ibm.com/{namespace}/{issues_repo}"
sm_name                   = "sm-compliance-secrets"
sm_location               = "eu-gb"
sm_resource_group         = "Default"
sm_secret_group           = "Default"
```

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement_ibm)                   | >=1.51.0 |

## Modules

| Name                                                                    | Source         | Version |
| ----------------------------------------------------------------------- | -------------- | ------- |
| <a name="module_integrations"></a> [integrations](#module_integrations) | ./integrations | n/a     |
| <a name="module_pipeline_cc"></a> [pipeline_cc](#module_pipeline_cc)    | ./pipeline-cc  | n/a     |
| <a name="module_repositories"></a> [repositories](#module_repositories) | ./repositories | n/a     |
| <a name="module_services"></a> [services](#module_services)             | ./services     | n/a     |

## Resources

| Name                                                                                                                                                 | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain)                      | resource    |
| [ibm_cd_toolchain_tool_pipeline.cc_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource    |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group)                   | data source |

## Inputs

| Name                                                                                                                                                                        | Description                                                                                                                                                                                          | Type     | Default                                                                       | Required |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ----------------------------------------------------------------------------- | :------: |
| <a name="input_app_group"></a> [app_group](#input_app_group)                                                                                                                | Specify Git user/group for app repo.                                                                                                                                                                 | `string` | `""`                                                                          |    no    |
| <a name="input_app_repo_auth_type"></a> [app_repo_auth_type](#input_app_repo_auth_type)                                                                                     | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_app_repo_branch"></a> [app_repo_branch](#input_app_repo_branch)                                                                                              | The default branch of the app repo.                                                                                                                                                                  | `string` | `"master"`                                                                    |    no    |
| <a name="input_app_repo_git_id"></a> [app_repo_git_id](#input_app_repo_git_id)                                                                                              | The Git ID of the repository.                                                                                                                                                                        | `string` | `""`                                                                          |    no    |
| <a name="input_app_repo_git_provider"></a> [app_repo_git_provider](#input_app_repo_git_provider)                                                                            | The type of the Git provider.                                                                                                                                                                        | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_app_repo_git_token_secret_name"></a> [app_repo_git_token_secret_name](#input_app_repo_git_token_secret_name)                                                 | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_app_repo_url"></a> [app_repo_url](#input_app_repo_url)                                                                                                       | This Git URL for the application repository.                                                                                                                                                         | `string` | `""`                                                                          |    no    |
| <a name="input_artifactory_dashboard_url"></a> [artifactory_dashboard_url](#input_artifactory_dashboard_url)                                                                | Type the URL that you want to navigate to when you click the Artifactory integration tile.                                                                                                           | `string` | `""`                                                                          |    no    |
| <a name="input_artifactory_repo_name"></a> [artifactory_repo_name](#input_artifactory_repo_name)                                                                            | Type the name of your Artifactory repository where your docker images are located.                                                                                                                   | `string` | `"wcp-compliance-automation-team-docker-local"`                               |    no    |
| <a name="input_artifactory_repo_url"></a> [artifactory_repo_url](#input_artifactory_repo_url)                                                                               | Type the URL for your Artifactory release repository.                                                                                                                                                | `string` | `""`                                                                          |    no    |
| <a name="input_artifactory_token_secret_name"></a> [artifactory_token_secret_name](#input_artifactory_token_secret_name)                                                    | Name of the artifactory token secret in the secret provider.                                                                                                                                         | `string` | `"artifactory-token"`                                                         |    no    |
| <a name="input_artifactory_user"></a> [artifactory_user](#input_artifactory_user)                                                                                           | Type the User ID or email for your Artifactory repository.                                                                                                                                           | `string` | `""`                                                                          |    no    |
| <a name="input_authorization_policy_creation"></a> [authorization_policy_creation](#input_authorization_policy_creation)                                                    | Set to disabled if you do not want this policy auto created.                                                                                                                                         | `string` | `""`                                                                          |    no    |
| <a name="input_compliance_base_image"></a> [compliance_base_image](#input_compliance_base_image)                                                                            | Pipeline baseimage to run most of the built-in pipeline code.                                                                                                                                        | `string` | `""`                                                                          |    no    |
| <a name="input_compliance_pipeline_group"></a> [compliance_pipeline_group](#input_compliance_pipeline_group)                                                                | Specify Git user/group for compliance pipline repo.                                                                                                                                                  | `string` | `""`                                                                          |    no    |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance_pipeline_repo_auth_type](#input_compliance_pipeline_repo_auth_type)                                     | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance_pipeline_repo_git_provider](#input_compliance_pipeline_repo_git_provider)                            | Choose the default git provider for change management repo                                                                                                                                           | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance_pipeline_repo_git_token_secret_name](#input_compliance_pipeline_repo_git_token_secret_name) | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_cos_api_key_secret_name"></a> [cos_api_key_secret_name](#input_cos_api_key_secret_name)                                                                      | COS API key                                                                                                                                                                                          | `string` | `"cos-api-key"`                                                               |    no    |
| <a name="input_cos_bucket_name"></a> [cos_bucket_name](#input_cos_bucket_name)                                                                                              | COS bucket name.                                                                                                                                                                                     | `string` | `""`                                                                          |    no    |
| <a name="input_cos_endpoint"></a> [cos_endpoint](#input_cos_endpoint)                                                                                                       | COS endpoint name.                                                                                                                                                                                   | `string` | `""`                                                                          |    no    |
| <a name="input_default_git_provider"></a> [default_git_provider](#input_default_git_provider)                                                                               | Choose the default git provider for app repo                                                                                                                                                         | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_doi_environment"></a> [doi_environment](#input_doi_environment)                                                                                              | DevOps Insights environment for DevSecOps CD deployment.                                                                                                                                             | `string` | `""`                                                                          |    no    |
| <a name="input_doi_toolchain_id"></a> [doi_toolchain_id](#input_doi_toolchain_id)                                                                                           | DevOps Insights Toolchain ID to link to.                                                                                                                                                             | `string` | `""`                                                                          |    no    |
| <a name="input_enable_artifactory"></a> [enable_artifactory](#input_enable_artifactory)                                                                                     | Set true to enable artifacory for devsecops.                                                                                                                                                         | `bool`   | `false`                                                                       |    no    |
| <a name="input_enable_key_protect"></a> [enable_key_protect](#input_enable_key_protect)                                                                                     | Set to enable Key Protect Integration.                                                                                                                                                               | `bool`   | `false`                                                                       |    no    |
| <a name="input_enable_pipeline_dockerconfigjson"></a> [enable_pipeline_dockerconfigjson](#input_enable_pipeline_dockerconfigjson)                                           | Enable to add the pipeline-dockerconfigjson to the pipeline properties.                                                                                                                              | `bool`   | `false`                                                                       |    no    |
| <a name="input_enable_secrets_manager"></a> [enable_secrets_manager](#input_enable_secrets_manager)                                                                         | Set to enable Secrets Manager Integration.                                                                                                                                                           | `bool`   | `true`                                                                        |    no    |
| <a name="input_enable_slack"></a> [enable_slack](#input_enable_slack)                                                                                                       | Set to true to create the integration.                                                                                                                                                               | `bool`   | `false`                                                                       |    no    |
| <a name="input_environment_tag"></a> [environment_tag](#input_environment_tag)                                                                                              | Tag name that represents the target environment in the inventory. Example: prod_latest.                                                                                                              | `string` | `"prod_latest"`                                                               |    no    |
| <a name="input_evidence_group"></a> [evidence_group](#input_evidence_group)                                                                                                 | Specify Git user/group for evidence repo.                                                                                                                                                            | `string` | `""`                                                                          |    no    |
| <a name="input_evidence_repo_auth_type"></a> [evidence_repo_auth_type](#input_evidence_repo_auth_type)                                                                      | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_evidence_repo_git_provider"></a> [evidence_repo_git_provider](#input_evidence_repo_git_provider)                                                             | Git provider for evidence repo                                                                                                                                                                       | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence_repo_git_token_secret_name](#input_evidence_repo_git_token_secret_name)                                  | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_evidence_repo_url"></a> [evidence_repo_url](#input_evidence_repo_url)                                                                                        | This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates.                                                                                       | `string` | n/a                                                                           |   yes    |
| <a name="input_ibmcloud_api"></a> [ibmcloud_api](#input_ibmcloud_api)                                                                                                       | IBM Cloud API Endpoint.                                                                                                                                                                              | `string` | `"https://cloud.ibm.com"`                                                     |    no    |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud_api_key](#input_ibmcloud_api_key)                                                                                           | API key used to create the toolchains.                                                                                                                                                               | `string` | n/a                                                                           |   yes    |
| <a name="input_inventory_group"></a> [inventory_group](#input_inventory_group)                                                                                              | Specify Git user/group for inventory repo.                                                                                                                                                           | `string` | `""`                                                                          |    no    |
| <a name="input_inventory_repo_auth_type"></a> [inventory_repo_auth_type](#input_inventory_repo_auth_type)                                                                   | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_inventory_repo_git_provider"></a> [inventory_repo_git_provider](#input_inventory_repo_git_provider)                                                          | Git provider for inventory repo                                                                                                                                                                      | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory_repo_git_token_secret_name](#input_inventory_repo_git_token_secret_name)                               | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_inventory_repo_url"></a> [inventory_repo_url](#input_inventory_repo_url)                                                                                     | This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates.                                                                                             | `string` | n/a                                                                           |   yes    |
| <a name="input_issues_group"></a> [issues_group](#input_issues_group)                                                                                                       | Specify Git user/group for issues repo.                                                                                                                                                              | `string` | `""`                                                                          |    no    |
| <a name="input_issues_repo_auth_type"></a> [issues_repo_auth_type](#input_issues_repo_auth_type)                                                                            | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_issues_repo_git_provider"></a> [issues_repo_git_provider](#input_issues_repo_git_provider)                                                                   | Git provider for issue repo                                                                                                                                                                          | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues_repo_git_token_secret_name](#input_issues_repo_git_token_secret_name)                                        | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_issues_repo_url"></a> [issues_repo_url](#input_issues_repo_url)                                                                                              | This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates.                                                                                                | `string` | n/a                                                                           |   yes    |
| <a name="input_kp_location"></a> [kp_location](#input_kp_location)                                                                                                          | IBM Cloud location/region containing the Key Protect instance.                                                                                                                                       | `string` | `"us-south"`                                                                  |    no    |
| <a name="input_kp_name"></a> [kp_name](#input_kp_name)                                                                                                                      | Name of the Key Protect instance where the secrets are stored.                                                                                                                                       | `string` | `"kp-compliance-secrets"`                                                     |    no    |
| <a name="input_kp_resource_group"></a> [kp_resource_group](#input_kp_resource_group)                                                                                        | The resource group containing the Key Protect instance for your secrets.                                                                                                                             | `string` | `"Default"`                                                                   |    no    |
| <a name="input_link_to_doi_toolchain"></a> [link_to_doi_toolchain](#input_link_to_doi_toolchain)                                                                            | Enable a link to a DevOps Insights instance in another toolchain, true or false.                                                                                                                     | `bool`   | `false`                                                                       |    no    |
| <a name="input_opt_in_auto_close"></a> [opt_in_auto_close](#input_opt_in_auto_close)                                                                                        | Enables auto-closing of issues coming from vulnerabilities, once the vulnerability is no longer detected by the CC pipeline run.                                                                     | `string` | `"1"`                                                                         |    no    |
| <a name="input_opt_in_dynamic_api_scan"></a> [opt_in_dynamic_api_scan](#input_opt_in_dynamic_api_scan)                                                                      | To enable the OWASP Zap API scan. '1' enable or '0' disable.                                                                                                                                         | `string` | `""`                                                                          |    no    |
| <a name="input_opt_in_dynamic_scan"></a> [opt_in_dynamic_scan](#input_opt_in_dynamic_scan)                                                                                  | To enable the OWASP Zap scan. '1' enable or '0' disable.                                                                                                                                             | `string` | `""`                                                                          |    no    |
| <a name="input_opt_in_dynamic_ui_scan"></a> [opt_in_dynamic_ui_scan](#input_opt_in_dynamic_ui_scan)                                                                         | To enable the OWASP Zap UI scan. '1' enable or '0' disable.                                                                                                                                          | `string` | `""`                                                                          |    no    |
| <a name="input_pipeline_branch"></a> [pipeline_branch](#input_pipeline_branch)                                                                                              | The branch within pipeline definitions repository for Compliance CC Toolchain.                                                                                                                       | `string` | `"open-v9"`                                                                   |    no    |
| <a name="input_pipeline_config_group"></a> [pipeline_config_group](#input_pipeline_config_group)                                                                            | Specify Git user/group for pipeline config repo.                                                                                                                                                     | `string` | `""`                                                                          |    no    |
| <a name="input_pipeline_config_path"></a> [pipeline_config_path](#input_pipeline_config_path)                                                                               | The name and path of the pipeline-config.yaml file within the pipeline-config repo.                                                                                                                  | `string` | `".pipeline-config.yaml"`                                                     |    no    |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline_config_repo_auth_type](#input_pipeline_config_repo_auth_type)                                                 | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'.                                                                                                  | `string` | `"oauth"`                                                                     |    no    |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline_config_repo_branch](#input_pipeline_config_repo_branch)                                                          | Specify a branch of a repository to clone that contains a custom pipeline-config.yaml file.                                                                                                          | `string` | `""`                                                                          |    no    |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline_config_repo_clone_from_url](#input_pipeline_config_repo_clone_from_url)                                  | Specify a repository to clone that contains a custom pipeline-config.yaml file.                                                                                                                      | `string` | `""`                                                                          |    no    |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline_config_repo_existing_url](#input_pipeline_config_repo_existing_url)                                        | Specify a repository containing a custom pipeline-config.yaml file.                                                                                                                                  | `string` | `""`                                                                          |    no    |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline_config_repo_git_provider](#input_pipeline_config_repo_git_provider)                                        | Git provider for pipeline repo config                                                                                                                                                                | `string` | `"hostedgit"`                                                                 |    no    |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline_config_repo_git_token_secret_name](#input_pipeline_config_repo_git_token_secret_name)             | Name of the Git token secret in the secret provider.                                                                                                                                                 | `string` | `"git-token"`                                                                 |    no    |
| <a name="input_pipeline_debug"></a> [pipeline_debug](#input_pipeline_debug)                                                                                                 | Set to '1' to enable debug logging.                                                                                                                                                                  | `string` | `"0"`                                                                         |    no    |
| <a name="input_pipeline_dockerconfigjson_secret_name"></a> [pipeline_dockerconfigjson_secret_name](#input_pipeline_dockerconfigjson_secret_name)                            | Name of the dockerconfigjson secret in the secret provider.                                                                                                                                          | `string` | `"pipeline-dockerconfigjson"`                                                 |    no    |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline_ibmcloud_api_key_secret_name](#input_pipeline_ibmcloud_api_key_secret_name)                            | Name of the Cloud API key secret in the secret provider.                                                                                                                                             | `string` | `"ibmcloud-api-key"`                                                          |    no    |
| <a name="input_repositories_prefix"></a> [repositories_prefix](#input_repositories_prefix)                                                                                  | Prefix name for the cloned compliance repos.                                                                                                                                                         | `string` | `"compliance"`                                                                |    no    |
| <a name="input_scc_enable_scc"></a> [scc_enable_scc](#input_scc_enable_scc)                                                                                                 | Enable the SCC integration.                                                                                                                                                                          | `bool`   | `true`                                                                        |    no    |
| <a name="input_scc_integration_name"></a> [scc_integration_name](#input_scc_integration_name)                                                                               | The name of the SCC integration name.                                                                                                                                                                | `string` | `"Security and Compliance"`                                                   |    no    |
| <a name="input_slack_channel_name"></a> [slack_channel_name](#input_slack_channel_name)                                                                                     | The Slack channel that notifications will be posted to.                                                                                                                                              | `string` | `"my-channel"`                                                                |    no    |
| <a name="input_slack_notifications"></a> [slack_notifications](#input_slack_notifications)                                                                                  | The switch that turns the Slack integration on or off.                                                                                                                                               | `string` | `"0"`                                                                         |    no    |
| <a name="input_slack_pipeline_fail"></a> [slack_pipeline_fail](#input_slack_pipeline_fail)                                                                                  | Generate pipeline failed notifications.                                                                                                                                                              | `bool`   | `true`                                                                        |    no    |
| <a name="input_slack_pipeline_start"></a> [slack_pipeline_start](#input_slack_pipeline_start)                                                                               | Generate pipeline start notifications.                                                                                                                                                               | `bool`   | `true`                                                                        |    no    |
| <a name="input_slack_pipeline_success"></a> [slack_pipeline_success](#input_slack_pipeline_success)                                                                         | Generate pipeline succeeded notifications.                                                                                                                                                           | `bool`   | `true`                                                                        |    no    |
| <a name="input_slack_team_name"></a> [slack_team_name](#input_slack_team_name)                                                                                              | The Slack team name, which is the word or phrase before .slack.com in the team URL.                                                                                                                  | `string` | `"my-team"`                                                                   |    no    |
| <a name="input_slack_toolchain_bind"></a> [slack_toolchain_bind](#input_slack_toolchain_bind)                                                                               | Generate tool added to toolchain notifications.                                                                                                                                                      | `bool`   | `true`                                                                        |    no    |
| <a name="input_slack_toolchain_unbind"></a> [slack_toolchain_unbind](#input_slack_toolchain_unbind)                                                                         | Generate tool removed from toolchain notifications.                                                                                                                                                  | `bool`   | `true`                                                                        |    no    |
| <a name="input_slack_webhook_secret_name"></a> [slack_webhook_secret_name](#input_slack_webhook_secret_name)                                                                | Name of the webhook secret in the secret provider.                                                                                                                                                   | `string` | `"slack-webhook"`                                                             |    no    |
| <a name="input_sm_location"></a> [sm_location](#input_sm_location)                                                                                                          | IBM Cloud location/region containing the Secrets Manager instance.                                                                                                                                   | `string` | `"us-south"`                                                                  |    no    |
| <a name="input_sm_name"></a> [sm_name](#input_sm_name)                                                                                                                      | Name of the Secrets Manager instance where the secrets are stored.                                                                                                                                   | `string` | `"sm-compliance-secrets"`                                                     |    no    |
| <a name="input_sm_resource_group"></a> [sm_resource_group](#input_sm_resource_group)                                                                                        | The resource group containing the Secrets Manager instance for your secrets.                                                                                                                         | `string` | `"Default"`                                                                   |    no    |
| <a name="input_sm_secret_group"></a> [sm_secret_group](#input_sm_secret_group)                                                                                              | Group in Secrets Manager for organizing/grouping secrets.                                                                                                                                            | `string` | `"Default"`                                                                   |    no    |
| <a name="input_sonarqube_config"></a> [sonarqube_config](#input_sonarqube_config)                                                                                           | Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. Default is default. | `string` | `"default"`                                                                   |    no    |
| <a name="input_toolchain_description"></a> [toolchain_description](#input_toolchain_description)                                                                            | Description for the CC Toolchain.                                                                                                                                                                    | `string` | `"Toolchain created with terraform template for DevSecOps CC Best Practices"` |    no    |
| <a name="input_toolchain_name"></a> [toolchain_name](#input_toolchain_name)                                                                                                 | Name of the CC Toolchain.                                                                                                                                                                            | `string` | `"DevSecOps CC Toolchain - Terraform"`                                        |    no    |
| <a name="input_toolchain_region"></a> [toolchain_region](#input_toolchain_region)                                                                                           | IBM Cloud region where the toolchain is created                                                                                                                                                      | `string` | `"us-south"`                                                                  |    no    |
| <a name="input_toolchain_resource_group"></a> [toolchain_resource_group](#input_toolchain_resource_group)                                                                   | Resource group within which the toolchain is created                                                                                                                                                 | `string` | `"Default"`                                                                   |    no    |

## Outputs

| Name                                                                                                                 | Description                                                                   |
| -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| <a name="output_cc_pipeline_id"></a> [cc_pipeline_id](#output_cc_pipeline_id)                                        | The CC pipeline ID.                                                           |
| <a name="output_key_protect_instance_id"></a> [key_protect_instance_id](#output_key_protect_instance_id)             | The Key Protect instance ID.                                                  |
| <a name="output_pipeline_repo_url"></a> [pipeline_repo_url](#output_pipeline_repo_url)                               | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_secrets_manager_instance_id"></a> [secrets_manager_instance_id](#output_secrets_manager_instance_id) | The Secrets Manager instance ID.                                              |
| <a name="output_toolchain_id"></a> [toolchain_id](#output_toolchain_id)                                              | The CC toolchain ID.                                                          |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->

## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.

<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
