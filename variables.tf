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

variable "pipeline_doi_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance."
  default     = ""
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

variable "compliance_pipeline_repo_url" {
  type        = string
  default     = ""
  description = "Url of pipeline repo template to be cloned"
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

variable "pipeline_config_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "pipeline_config_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "pipeline_config_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "pipeline_config_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "pipeline_config_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "pipeline_config_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "pipeline_config_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
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

variable "app_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "app_repo_clone_to_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "app_repo_clone_to_git_id" {
  type        = string
  description = "Custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "app_repo_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = "hostedgit"
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

variable "peer_review_compliance" {
  type        = string
  description = "Set to `1` to enable peer review."
  default     = "1"
}

variable "default_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for app repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.default_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
}

variable "compliance_pipeline_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for change management repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.compliance_pipeline_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
}

variable "compliance_pipeline_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "pipeline_config_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for pipeline repo config"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.pipeline_config_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for pipeline config repo."
  }
}

variable "inventory_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for inventory repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.inventory_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for Inventory repo."
  }
}

variable "evidence_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for evidence repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.evidence_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for evidence repo."
  }
}

variable "issues_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for issue repo "
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.issues_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for issue repo."
  }
}

variable "issues_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "evidence_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "inventory_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "inventory_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "inventory_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "inventory_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "inventory_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "inventory_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "inventory_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "issues_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = true
}

variable "issues_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "issues_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "issues_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "issues_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "issues_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "evidence_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "evidence_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "evidence_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "evidence_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "evidence_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "evidence_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "compliance_pipelines_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "compliance_pipeline_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
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

variable "app_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "app_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "app_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "app_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
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

variable "scc_attachment_id" {
  type        = string
  description = "An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_instance_crn" {
  type        = string
  description = "The Security and Compliance Center service instance CRN (Cloud Resource Name). This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. The value must match the regular expression."
  default     = ""
}

variable "scc_profile_name" {
  type        = string
  description = "The name of a Security and Compliance Center profile. Use the `IBM Cloud Framework for Financial Services` profile, which contains the DevSecOps Toolchain rules. Or use a user-authored customized profile that has been configured to contain those rules. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_profile_version" {
  type        = string
  description = "The version of a Security and Compliance Center profile, in SemVer format, like `0.0.0`. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_use_profile_attachment" {
  type        = string
  description = "Set to `enabled` to enable use profile with attachment, so that the scripts in the pipeline can interact with the Security and Compliance Center service. When enabled, other parameters become relevant; `scc_scc_scc_api_key_secret_name`, `scc_instance_crn`, `scc_profile_name`, `scc_profile_version`, `scc_attachment_id`."
  default     = "disabled"
}

variable "scc_scc_api_key_secret_name" {
  type        = string
  description = "The Security and Compliance Center api-key secret in the secret provider."
  default     = "scc-api-key"
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

variable "pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CC Toolchain."
  default     = "open-v10"
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

variable "pipeline_ibmcloud_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "scc_scc_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the Security and Compliance tool secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "cos_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "slack_webhook_secret_group" {
  type        = string
  description = "Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_dockerconfigjson_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DockerConfigJson secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "app_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the App repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "issues_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "inventory_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "evidence_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "compliance_pipeline_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_config_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "artifactory_token_secret_group" {
  type        = string
  description = "Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_git_token_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline Git token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_doi_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "sonarqube_secret_group" {
  type        = string
  description = "Secret group prefix for the SonarQube secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
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

variable "enable_artifactory" {
  type        = bool
  default     = false
  description = "Set true to enable artifacory for devsecops."
}

variable "enable_pipeline_git_token" {
  type        = bool
  description = "Enable to add `git-token` to the pipeline properties."
  default     = false
}

variable "artifactory_dashboard_url" {
  type        = string
  default     = ""
  description = "Type the URL that you want to navigate to when you click the Artifactory integration tile."
}

variable "artifactory_user" {
  type        = string
  description = "Type the User ID or email for your Artifactory repository."
  default     = ""
}

variable "artifactory_token_secret_name" {
  type        = string
  default     = "artifactory-token"
  description = "Name of the artifactory token secret in the secret provider."
}

variable "pipeline_git_token_secret_name" {
  type        = string
  description = "Name of the pipeline Git token secret in the secret provider."
  default     = "pipeline-git-token"
}

variable "artifactory_repo_name" {
  type        = string
  default     = "wcp-compliance-automation-team-docker-local"
  description = "Type the name of your Artifactory repository where your docker images are located."
}

variable "artifactory_repo_url" {
  type        = string
  default     = ""
  description = "Type the URL for your Artifactory release repository."
}

variable "sm_integration_name" {
  type        = string
  description = "The name of the Secrets Manager integration."
  default     = "sm-compliance-secrets"
}

variable "kp_integration_name" {
  type        = string
  description = "The name of the Key Protect integration."
  default     = "kp-compliance-secrets"
}

variable "slack_integration_name" {
  type        = string
  description = "The name of the Slack integration."
  default     = "slack-compliance"
}

####### Event Notifications #################
variable "event_notifications_tool_name" {
  type        = string
  description = "The name of the Event Notifications integration."
  default     = "Event Notifications"
}

variable "event_notifications_crn" {
  type        = string
  description = "The CRN for the Event Notifications instance."
  default     = ""
}

######SonarQube ############################
variable "sonarqube_integration_name" {
  type        = string
  description = "The name of the SonarQube integration."
  default     = "SonarQube"
}

variable "sonarqube_user" {
  type        = string
  description = "The name of the SonarQube user."
  default     = ""
}

variable "sonarqube_secret_name" {
  type        = string
  description = "The name of the SonarQube secret."
  default     = "sonarqube-secret"
}

variable "sonarqube_is_blind_connection" {
  type        = string
  description = "When set to `true`, instructs IBM Cloud Continuous Delivery to not validate the configuration of this integration. Set this to true if the SonarQube server is not addressable on the public internet."
  default     = true
}

variable "sonarqube_server_url" {
  type        = string
  description = "The URL to the SonarQube server."
  default     = ""
}

#################################
variable "trigger_timed_name" {
  type        = string
  description = "The name of the CC pipeline Timed trigger."
  default     = "CC Timed Trigger"
}
variable "trigger_timed_enable" {
  type        = bool
  description = "Set to `true` to enable the CI pipeline Timed trigger."
  default     = false
}
variable "trigger_timed_cron_schedule" {
  type        = string
  description = "Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *_/2 * * * - every 2 hours."
  default     = "0 4 * * *"
}

variable "trigger_manual_name" {
  type        = string
  description = "The name of the CC pipeline Manual trigger."
  default     = "CC Manual Trigger"
}
variable "trigger_manual_enable" {
  type        = bool
  description = "Set to `true` to enable the CC pipeline Manual trigger."
  default     = true
}

variable "trigger_manual_pruner_name" {
  type        = string
  description = "The name of the manual Pruner trigger."
  default     = "Evidence Pruner Manual Trigger"
}
variable "trigger_manual_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the manual Pruner trigger."
  default     = true
}

variable "trigger_timed_pruner_name" {
  type        = string
  description = "The name of the timed Pruner trigger."
  default     = "Evidence Pruner Timed Trigger"
}
variable "trigger_timed_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the timed Pruner trigger."
  default     = false
}
