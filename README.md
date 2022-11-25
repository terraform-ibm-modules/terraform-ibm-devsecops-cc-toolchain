
## DevSecOps CC Toolchain Terraform Template

#### Introduction

#### Code Structure

The terraform code for DevSecOps CC Toolchain comprises of different folders to provide a logical grouping of various resources. 
Terraform considers each folder as a module, and hence each of these logical groups (folders) are treated by terraform as seperate modules.

 1. repositories
Resource definitions for all the repositories required for the DevSecOps CC Toolchain. All these repositories are created as **`ibm_cd_toolchain_tool_git`** Toolchain Integrations. By default, the terrform template **`clones`** these repositories in your GRIT (default provider) account. If you wish to use a different provider please update the variables in **`variables.tf`** file. The repositories created are:
	 - Application Repository 
	 - Pipeline Repository 
	 - Evidence Repository
	 - Inventory Repository 
	 - Issues/Incidence Repository

2. pipeline-pr
Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_cd_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
	 - Tekton Pipeline 
	 - Tekton Pipeline Definitions ( DevSecOps Compliance )
	 - Tekton Pipeline Triggers
     - Tekton Pipeline Environment Variables
 
3. pipeline-ci 
Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_cd_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
	 - Tekton Pipeline 
	 - Tekton Pipeline Definitions ( DevSecOps Compliance )
	 - Tekton Pipeline Triggers
     - Tekton Pipeline Environment Variables

> While referring any environment variables from Secret Store ( Key Protect, Secrets Manager ) use the below syntax
> ```
>
>```



4. integrations
Toolchain Integrations required by the toolchain are created here. Currently, the toolchain creates following integrations. More integrations will be added soon.
	 - Key Protect 
	 - Cloud Object Store 
	 - Slack 
	 - DevOps Insight 
	 - Eclipse Orion Web IDE

5. service
Toolchain can leverage information about other IBM Cloud Services like IKS Cluster, ICR, COS and can lookup respective resources via terraform data sources which can then be used to setup up other integrations.
	 - IBM Cloud IKS Cluster `ibm_container_cluster` 
	 - IBM Cloud ICR `ibm_cr_namespaces` 
	 - IBM Cloud Resource for Key Protect `ibm_resource_instance`

6. main
The main module is where all the other modules are instantiated. The current dependencies between various module and also on the main module is depicted below.

	 - repositories - Independent
	 - services - Independent
	 - integrations - repositories, services
	 - pipeline-ci - repositories, services, integrations
	 - pipeline-pr - repositories, services, integrations

#### Setup and Run the template

Please refer to the documentation [here](https://ibm.ent.box.com/file/937574387078)
to setup the provider and go-runtime required for creating the toolchain via terraform.

1. Rename the **`variables.tfvar.example`** to **`variables.tfvar`**.

2. Provide appropriate values for the variables in the **`variables.tfvar`** to point to various resources within your account.

| Variable      | Description | 
| ---           | ----        | 
| toolchain_resource_group  | Resource Group for the toolchain     |
| toolchain_region          | IBM Cloud Region for the toolchain |
| toolchain_name            | Name for the toolchain      |
| toolchain_description     | Description for the toolchain |
| app_name                  | Name of the application       |
| app_image_name            | Name of the docker image for the application     |
| ibm_cloud_api_key         | IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead. |
| ibm_cloud_api             | IBM Cloud API Endpoint     |
|: Variable for Repositories : |
| app_repo                  | Git Repository and Issue Tracking (GRIT) repository hosting sample nodejs application |
| app_repo_type             | hostedgit, github     |
| pipeline_repo             | Git Repository and Issue Tracking (GRIT) repository hosting DevSecOps Compliance Pipeline Definition |
| pipeline_repo_type        | hostedgit, github     |
| evidence_repo             | Git Repository and Issue Tracking (GRIT) repository hosting template for Evidence Locker |
| evidence_repo_type        | hostedgit, github     |
| inventory_repo            | Git Repository and Issue Tracking (GRIT) repository hosting template for Inventory |
| inventory_repo_type       | hostedgit, github     |
| issues_repo               | Git Repository and Issue Tracking (GRIT) repository hosting template for Incident/Issues |
| issues_repo_type          | hostedgit, github     |
|:    Variables for Services    :|
| registry_namespace        | IBM Cloud ICR Namespace where the docker image built for the application is to be pushed |
| sm_resource_group         | The resource group containing the Secrets Manager instance for your secrets. |
| sm_location               | IBM Cloud location containing the Secrets Manager instance. |
| sm_name                   | Name of the Secrets Manager instance where the secrets are stored. |
| sm_secret_group           | The Secrets Manager secret group containing your secrets. |
| cos_endpoint              | Cloud Object Storage endpoint name |
| cos_bucket_name           | Cloud Object Storage bucket name |

3. Run the terraform initialization command
```
terraform init
```
You should see an output similiar to below
```


You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
4. Create the toolchain with variable overrides present in **`variables.tfvar`** file
```
 terraform apply -var-file=./variables.tfvar 
```