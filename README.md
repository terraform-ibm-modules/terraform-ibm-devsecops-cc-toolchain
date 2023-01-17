
## DevSecOps CC Toolchain Terraform Template

### Note: Very early access to this terraform toolchain is being provided on as is basis and under active development, variables and variable names might change.

### Introduction

Welcome to the world of Toolchain As Code !!! 

The current project provides code to create DevSecOps CC Reference Toolchain using Terraform Code. In addition to creating the toolchain, the code also creates various toolchain integrations required by the CC Pipeline.

### Prerequisites

#### Resources

The DevSecOps CC Toolchain requires the following
* An instance of [Secrets Manager](https://cloud.ibm.com/catalog/services/secrets-manager) with the following named secrets.
   1.  'ibmcloud-api-key' - an apikey for the account containing the toolchain. See [APIKEY](https://cloud.ibm.com/iam/apikeys)
* An additional apikey to be used by the terraform cli to access your account. Take note of this apikey. 
* An existing DevSecOps CI toolchain (The previous requirements would should have already been set up prior to the CI toolchain creation)

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
Run 'terraform -help'

##### Other Platforms
For additional platforms please see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli



### Terraform Commands (basic)
1. terraform init - this command initialises the working directory containing the Terraform configuration files
2. terraform plan - a command that provides a preview of the actions that Terraform will perform on your infrastructure.
3. terraform apply - the command to perform the infrastructure modifications outlined using the plan command. 
4. terraform destroy - the command to delete all the resources managed by the Terraform project.
5. terraform help - lists and describes Terraform CLI commands

### Setup and create the toolchain

The following steps will create the default CI toolchain with the example application deploying to your Kubernetes cluster

1. Download the repository
2. cd into the downloaded directory
3. Rename the **`variables.tfvars.example`** to **`terraform.tfvars`**.
4. Provide appropriate values for the variables in the **`terraform.tfvars`** to point to various resources within your account. It is expected that the Secrets Manager already has the secrets outlined earlier. The example terraform.tfvars file contains all the required and optional variables. At a minimum the required variables are as follows:
   - toolchain_resource_group
   - toolchain_region
   - toolchain_name
   - ibm_cloud_api_key
   - registry_namespace
   - registry_region
   - sm_resource_group
   - sm_location
   - sm_name
   - sm_secret_group
   - deployment_repo
   - pipeline_repo
   - evidence_repo
   - inventory_repo
   - issues_repo

   Pay attention to values that use 'Default'. Some accounts might require it in lower case 'default'.
   Other variables can be deleted.

5. Run the terraform initialization command. Only needs to be run once. Multiple runs does not cause problems.

```
	terraform init
```
   You should see an output similar to
```
	Initializing modules...
	- integrations in integrations
	- pipeline-ci in pipeline-ci
	- pipeline-pr in pipeline-pr
	- repositories in repositories
	- services in services

	Initializing the backend...

	Initializing provider plugins...
	- Finding ibm-cloud/ibm versions matching ">= 1.48.0"...
	- Installing ibm-cloud/ibm v1.48.0...
	- Installed ibm-cloud/ibm v1.48.0 (self-signed, key ID AAD3B791C49CC253)
```
6. Run the plan command. This will generate an output showing resources that will be created and highlight potential issues

```
    terraform plan
```

7. Run the apply command which will create all the resources

```
   terraform apply
```
You should see a similar output
```
   secrets_manager_instance_id = "cd1472b8-9a3a-481e-96a1-55515bcc574f"
   toolchain_id = "847b26ec-d7f4-41b9-a90d-e73ec3a927ce"

```

Take note of the outputs. The values can be used for setting up the DevSecOps Terraform CD and CC toolchains

8. The new toolchain should now be visible in your account
You can navigate directly to it by going to
```
   https://cloud.ibm.com/devops/toolchains/{toolchain_id}?env_id=ibm:yp:us-south
```

Where {toolchain_id} is replaced with the toolchain_id value from the output
```
   https://cloud.ibm.com/devops/toolchains/847b26ec-d7f4-41b9-a90d-e73ec3a927ce?env_id=ibm:yp:us-south
```


### Complete list of supported variables
| Variables      | Description | 
| ---           | ----        | 
| toolchain_resource_group  | Resource Group for the toolchain     |
| toolchain_region          | IBM Cloud Region for the toolchain |
| toolchain_name            | Name for the toolchain      |
| toolchain_description     | Description for the toolchain |t used in the pipeline, where a secret reference is used instead. |
|ibm_cloud_api_key          | apikey for the Terraform CLI to access account resources|
|authorization_policy_creation| Disable Service to Service Authorization Policy creation for secrets resolution. Set to "disabled" if you do not want this policy auto created|
|**Variables for Repositories** |
| deployment_repo           | https://us-south.git.cloud.ibm.com/open-toolchain/hello-compliance-deployment| 
| pipeline_repo              | https://us-south.git.cloud.ibm.com/open-toolchain/compliance-pipelines |
| evidence_repo             | The repo url for the Evidence repo created in the CI toolchain | 
| inventory_repo            | The repo url for the Inventory repo created in the CI toolchain |
|issues_repo                | The repo url for the Issues repo created in the CI toolchain |
|    **Variables for Services**    |
| registry_namespace        | IBM Cloud ICR Namespace where the docker image built for the application is to be pushed |
| registry_region           | IBM Cloud Region where the IBM Cloud Container Registry namespace is to be created. |
| sm_resource_group         | The resource group containing the Secrets Manager instance for your secrets. |
| sm_location               | IBM Cloud location/region containing the Secrets Manager instance. |
| sm_name                   | Name of the Secrets Manager instance where the secrets are stored. |
| sm_secret_group           | The Secrets Manager secret group containing your secrets. |
| cos_endpoint              | Cloud Object Storage endpoint name |
| cos_bucket_name           | Cloud Object Storage bucket name |

