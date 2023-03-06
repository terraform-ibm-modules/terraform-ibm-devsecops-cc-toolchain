variable "toolchain_resource_group" {
  type        = string
  description = "Resource group within which toolchain will be created"
  default     = "Default"
}

variable "ibm_cloud_api_key" {
  type        = string
  description = "IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead."
  sensitive   = true
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud api key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "scc_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud api key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "issues_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "evidence_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "inventory_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "compliance_pipeline_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "deployment_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "pipeline_config_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "ibm_cloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud region where your toolchain will be created"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the Toolchain."
  default     = "Terraform Toolchain Empty"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the Toolchain."
  default     = "Toolchain created with terraform template for DevSecOps CC Best Practices"
}

variable "registry_namespace" {
  type        = string
  description = "Namespace within the IBM Cloud Container Registry where application image need to be stored."
  default     = "alpha-cd-namespace"
}

variable "registry_region" {
  type        = string
  description = "IBM Cloud Region where the IBM Cloud Container Registry where registry is to be created."
  default     = "ibm:yp:us-south"
}

variable "deployment_repo_url" {
    type        = string
    description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
    default     = ""
}

#variable "deployment_repo" {
#}

variable "deployment_repo_type" {
    type        = string
    description = "The repository type for deployment repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "inventory_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "inventory_repo_type" {
    type        = string
    description = "The repository type for inventory repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "evidence_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "evidence_repo_type" {
    type        = string
    description = "The repository type for evidence repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "issues_repo_url" {
    type        = string
    description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "issues_repo_type" {
    type        = string
    description = "The repository type for issues repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "(Optional). Specify a repository containing a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "(Optional). Specify a repository to clone that contains a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "(Optional). Specify a branch of a repository to clone that contains a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo" {
  type        = string
  description = "(Optional). Specify the branch containing the custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config repo"
  default     = ".pipeline-config.yaml"
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "deployment_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "compliance_pipeline_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "slack_api_token" {
  type        = string
  description = "API Token for Slack Channel"
  default     = ""
}

variable "slack_channel_name" {
  type        = string
  description = "Name of Slack Channel"
  default     = ""
}

variable "slack_user_name" {
  type        = string
  description = "Name of Slack User"
  default     = ""
}

variable "scc_profile" {
  type        = string
  description = "Security and Compliance Profile"
  default     = "IBM Cloud for Financial Services v0.4.0"
}

variable "scc_scope" {
  type        = string
  description = "Security and Compliance Scope"
  default     = "DevsecOps Scope"
}

variable "scc_integration_name" {
  type        = string
  description = "The name of the SCC integration name"
  default     = "Security and Compliance"
}

variable "scc_enable_scc" {
  type        = bool
  description = "Enable the SCC integration"
  default     = false
}

variable "scc_evidence_namespace" {
  type        = string
  description = "The kind of evidence to be displayed, cc or cd"
  default     = "cc"
}

variable "scc_trigger_scan" {
  type        = string
  description = "Default:  disabled. Can be set to 'enabled'. Note each scan may incur a charge."
  default     = "disabled"
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "cos api key"
  default     = ""
}

variable "cos_endpoint" {
  type        = string
  description = "cos endpoint name"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "cos bucket name"
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "The Secrets Manager secret group containing your secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance for your secrets."
  default     = "Default"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored."
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance."
  default     = "us-south"
}

variable "kp_resource_group" {
  type        = string
  description = "The resource group containing the Key Protect instance for your secrets."
  default     = "Default"
}

variable "kp_name" {
  type        = string
  description = "Name of the Key Protect instance where the secrets are stored."
  default     = "kp-compliance-secrets"
}

variable "kp_location" {
  type        = string
  description = "IBM Cloud location/region containing the Key Protect instance."
  default     = "us-south"
}

variable "enable_key_protect" {
  type        = bool
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  default     = true
}

variable "deployment_repo_clone_from_url" {
    type        = string
    description = "(Optional) Override the default deployment by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
    default     = ""
}

variable "repositories_prefix" {
    type        = string
    description = ""
    default     = "compliance-tf"
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code"
  default     = ""
}

variable "authorization_policy_creation" {
    type        = string
    description = "Disable Toolchain Service to Secrets Manager Service auhorization policy creation"
    default     = ""
  }

  variable "doi_environment" {
  type = string
  description = "DevOpsInsights environment for DevSecOps CD deployment"
  default = ""
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOpsInsights instance in another toolchain, true or false"
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type = string
  description = "DevOpsInsights Toolchain ID to link to"
  default = ""  
}

variable "issues_group" {
  type        = string
  description = "Specify user/group for issues repo"
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify user/group for inventory repo"
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify user/group for evidence repo"
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify user/group for pipeline config repo"
  default     = ""
}

variable "deployment_group" {
  type        = string
  description = "Specify user/group for deployment repo"
  default     = ""
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify user/group for compliance pipline repo"
  default     = ""
}