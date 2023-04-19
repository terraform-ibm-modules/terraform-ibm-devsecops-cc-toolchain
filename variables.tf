variable "toolchain_resource_group" {
  type        = string
  description = "Resource group within which the toolchain is created"
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchains."
  sensitive   = true
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider."
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

variable "app_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "pipeline_config_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "ibmcloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint."
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud region where the toolchain is created"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the CC Toolchain."
  default     = "DevSecOps CC Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the CC Toolchain."
  default     = "Toolchain created with terraform template for DevSecOps CC Best Practices"
}

variable "app_repo_url" {
  type        = string
  description = "This Git URL for the application repository."
  default     = ""
}

variable "inventory_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "evidence_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "issues_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "Specify a repository containing a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "Specify a repository to clone that contains a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "Specify a branch of a repository to clone that contains a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config repo."
  default     = ".pipeline-config.yaml"
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "app_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "compliance_pipeline_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "pipeline_dockerconfigjson_secret_name" {
  type        = string
  description = "Name of the dockerconfigjson secret in the secret provider."
  default     = "pipeline-dockerconfigjson"
}

variable "enable_pipeline_dockerconfigjson" {
  type        = bool
  description = "Enable to add the pipeline-dockerconfigjson to the pipeline properties."
  default     = false
}

variable "app_repo_git_provider" {
  type        = string
  description = "The type of the Git provider."
  default     = "hostedgit"
}

variable "app_repo_branch" {
  type        = string
  description = "The default branch of the app repo."
  default     = "master"
}

variable "app_repo_git_id" {
  type        = string
  description = "The Git ID of the repository."
  default     = ""
}

variable "enable_slack" {
  type        = bool
  description = "Set to true to create the integration."
  default     = false
}

variable "slack_channel_name" {
  type        = string
  description = "The Slack channel that notifications will be posted to."
  default     = "my-channel"
}

variable "slack_team_name" {
  type        = string
  description = "The Slack team name, which is the word or phrase before .slack.com in the team URL."
  default     = "my-team"
}

variable "slack_pipeline_fail" {
  type        = bool
  description = "Generate pipeline failed notifications."
  default     = true
}

variable "slack_pipeline_start" {
  type        = bool
  description = "Generate pipeline start notifications."
  default     = true
}

variable "slack_pipeline_success" {
  type        = bool
  description = "Generate pipeline succeeded notifications."
  default     = true
}

variable "slack_toolchain_bind" {
  type        = bool
  description = "Generate tool added to toolchain notifications."
  default     = true
}

variable "slack_toolchain_unbind" {
  type        = bool
  description = "Generate tool removed from toolchain notifications."
  default     = true
}

variable "scc_integration_name" {
  type        = string
  description = "The name of the SCC integration name."
  default     = "Security and Compliance"
}

variable "scc_enable_scc" {
  type        = bool
  description = "Enable the SCC integration."
  default     = true
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "COS API key"
  default     = "cos-api-key"
}

variable "cos_endpoint" {
  type        = string
  description = "COS endpoint name."
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "COS bucket name."
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "Group in Secrets Manager for organizing/grouping secrets."
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
  description = "Set to enable Key Protect Integration."
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  description = "Set to enable Secrets Manager Integration."
  default     = true
}

variable "repositories_prefix" {
  type        = string
  description = "Prefix name for the cloned compliance repos."
  default     = "compliance"
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code."
  default     = ""
}

variable "authorization_policy_creation" {
  type        = string
  description = "Set to disabled if you do not want this policy auto created."
  default     = ""
}

variable "doi_environment" {
  type        = string
  description = "DevOps Insights environment for DevSecOps CD deployment."
  default     = ""
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOps Insights instance in another toolchain, true or false."
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOps Insights Toolchain ID to link to."
  default     = ""
}

variable "issues_group" {
  type        = string
  description = "Specify Git user/group for issues repo."
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify Git user/group for inventory repo."
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify Git user/group for evidence repo."
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify Git user/group for pipeline config repo."
  default     = ""
}

variable "app_group" {
  type        = string
  description = "Specify Git user/group for app repo."
  default     = ""
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify Git user/group for compliance pipline repo."
  default     = ""
}

variable "pipeline_debug" {
  type        = string
  description = "Set to '1' to enable debug logging."
  default     = "0"
}

variable "opt_in_dynamic_api_scan" {
  type        = string
  description = "To enable the OWASP Zap API scan. '1' enable or '0' disable."
  default     = ""
}

variable "opt_in_dynamic_ui_scan" {
  type        = string
  description = "To enable the OWASP Zap UI scan. '1' enable or '0' disable."
  default     = ""
}

variable "opt_in_dynamic_scan" {
  type        = string
  description = "To enable the OWASP Zap scan. '1' enable or '0' disable."
  default     = ""
}

variable "opt_in_auto_close" {
  type        = string
  description = "Enables auto-closing of issues coming from vulnerabilities, once the vulnerability is no longer detected by the CC pipeline run."
  default     = "1"
}

variable "sonarqube_config" {
  type        = string
  description = "Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. Default is default."
  default     = "default"
}

variable "slack_notifications" {
  type        = string
  description = "The switch that turns the Slack integration on or off."
  default     = "0"
}

variable "environment_tag" {
  type        = string
  description = "Tag name that represents the target environment in the inventory. Example: prod_latest."
  default     = "prod_latest"
}
