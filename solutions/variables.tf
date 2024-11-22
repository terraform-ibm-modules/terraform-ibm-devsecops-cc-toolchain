variable "add_pipeline_definitions" {
  type        = string
  description = "Set to `true` to add pipeline definitions."
  default     = "true"
}

variable "app_group" {
  type        = string
  description = "Specify Git user/group for app repo."
  default     = ""
}

variable "app_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "app_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "app_repo_branch" {
  type        = string
  description = "The default branch of the app repo."
  default     = "master"
}

variable "app_repo_clone_to_git_id" {
  type        = string
  description = "Custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "app_repo_clone_to_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "app_repo_git_id" {
  type        = string
  description = "The Git ID of the repository."
  default     = ""
}

variable "app_repo_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = "hostedgit"
}

variable "app_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the app repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.app_repo_git_token_secret_crn, "crn:") || var.app_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "app_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "app_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "app_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
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

variable "app_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "app_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the App repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "app_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "app_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "app_repo_url" {
  type        = string
  description = "This Git URL for the application repository."
  default     = ""
}

variable "artifactory_dashboard_url" {
  type        = string
  default     = ""
  description = "Type the URL that you want to navigate to when you click the Artifactory integration tile."
}

variable "artifactory_integration_name" {
  type        = string
  default     = "artifactory-dockerconfigjson"
  description = "The name of the Artifactory tool integration."
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

variable "artifactory_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Artifactory secret."
  default     = ""
  validation {
    condition     = startswith(var.artifactory_token_secret_crn, "crn:") || var.artifactory_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "artifactory_token_secret_group" {
  type        = string
  description = "Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "artifactory_token_secret_name" {
  type        = string
  default     = "artifactory-token"
  description = "Name of the artifactory token secret in the secret provider."
}

variable "artifactory_user" {
  type        = string
  description = "Type the User ID or email for your Artifactory repository."
  default     = ""
}

variable "authorization_policy_creation" {
  type        = string
  description = "Set to disabled if you do not want this policy auto created."
  default     = ""
}

variable "compliance_pipeline_existing_repo_url" {
  type        = string
  default     = ""
  description = "The URL of an existing compliance pipelines repository."
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify Git user/group for compliance pipline repo."
  default     = ""
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
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

variable "compliance_pipeline_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Compliance Pipeline repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.compliance_pipeline_repo_git_token_secret_crn, "crn:") || var.compliance_pipeline_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "compliance_pipeline_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "compliance_pipeline_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "compliance_pipeline_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "compliance_pipeline_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "compliance_pipeline_repo_url" {
  type        = string
  default     = ""
  description = "Url of pipeline repo template to be cloned"
}

variable "compliance_pipeline_source_repo_url" {
  type        = string
  default     = ""
  description = "The URL of a compliance pipelines repository to clone."
}

variable "compliance_pipelines_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "compliance_pipelines_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "compliance_pipelines_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "compliance_pipelines_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = false
}

variable "compliance_pipelines_repo_name" {
  type        = string
  description = "The repository name."
  default     = "compliance-pipelines"
}

variable "compliance_pipelines_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "compliance_pipelines_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "compliance_pipelines_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "cos_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Cloud Object Storage apikey."
  default     = ""
  validation {
    condition     = startswith(var.cos_api_key_secret_crn, "crn:") || var.cos_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "cos_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "COS API key"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "COS bucket name."
  default     = ""
}

variable "cos_dashboard_url" {
  type        = string
  description = "The dashboard URL for the COS toolcard."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_description" {
  type        = string
  description = "The COS description on the tool card."
  default     = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
}

variable "cos_documentation_url" {
  type        = string
  description = "The documentation URL that appears on the tool card."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_endpoint" {
  type        = string
  description = "COS endpoint name."
  default     = ""
}

variable "cos_integration_name" {
  type        = string
  description = "The name of the COS integration."
  default     = "Evidence Store"
}

variable "create_triggers" {
  type        = string
  description = "Set to `true` to create the default triggers associated with the compliance repos and sample app."
  default     = "true"
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

variable "default_locked_properties" {
  type        = list(string)
  description = "List of default locked properties"
  default     = ["app-concurrency", "app-deployment-timeout", "app-max-scale", "app-min-scale", "app-port", "app-visibility", "artifactory-dockerconfigjson", "cluster", "cluster-name", "cluster-namespace", "cluster-region", "code-engine-binding-resource-group", "code-engine-build-size", "code-engine-build-strategy", "code-engine-build-timeout", "code-engine-build-use-native-docker", "code-engine-deployment-type", "code-engine-project", "code-engine-region", "code-engine-resource-group", "code-engine-wait-timeout", "compliance-baseimage", "context-dir", "cos-api-key", "cos-bucket-name", "cos-endpoint", "cpu", "cra-bom-generate", "cra-deploy-analysis", "cra-generate-cyclonedx-format", "cra-vulnerability-scan", "custom-image-tag", "dev-cluster-namespace", "dev-region", "dev-resource-group", "dockerfile", "doi-environment", "doi-ibmcloud-api-key", "doi-toolchain-id", "env-from-configmaps", "env-from-secrets", "ephemeral-storage", "event-notifications", "evidence-repo", "git-token", "gosec-private-repository-host", "gosec-private-repository-ssh-key", "ibmcloud-api", "ibmcloud-api-key", "image-name", "incident-repo", "inventory-repo", "job-instances", "job-maxexecutiontime", "job-retrylimit", "memory", "opt-in-dynamic-api-scan", "opt-in-dynamic-scan", "opt-in-dynamic-ui-scan", "opt-in-gosec", "opt-in-sonar", "peer-review-compliance", "pipeline-config", "pipeline-config-branch", "pipeline-config-repo", "pipeline-dockerconfigjson", "print-code-signing-certificate", "registry-domain", "registry-namespace", "registry-region", "remove-unspecified-references-to-configuration-resources", "service-bindings", "signing-key", "slack-notifications", "sonarqube", "sonarqube-config", "source", "version"]
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOps Insights Toolchain ID to link to."
  default     = ""
}

variable "enable_artifactory" {
  type        = bool
  default     = false
  description = "Set true to enable artifacory for devsecops."
}

variable "enable_insights" {
  type        = bool
  description = "Set to `true` to enable the DevOps Insights integration."
  default     = true
}

variable "enable_key_protect" {
  type        = bool
  description = "Set to enable Key Protect Integration."
  default     = false
}

variable "enable_pipeline_git_token" {
  type        = bool
  description = "Enable to add `git-token` to the pipeline properties."
  default     = false
}

variable "enable_pipeline_notifications" {
  type        = bool
  description = "When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain."
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  description = "Set to enable Secrets Manager Integration."
  default     = true
}

variable "enable_slack" {
  type        = bool
  description = "Set to true to create the integration."
  default     = false
}

variable "environment_tag" {
  type        = string
  description = "Tag name that represents the target environment in the inventory. Example: prod_latest."
  default     = "prod_latest"
}

variable "event_notifications_crn" {
  type        = string
  description = "The CRN for the Event Notifications instance."
  default     = ""
}

variable "event_notifications_tool_name" {
  type        = string
  description = "The name of the Event Notifications integration."
  default     = "Event Notifications"
}

variable "evidence_group" {
  type        = string
  description = "Specify Git user/group for evidence repo."
  default     = ""
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "evidence_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "evidence_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
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

variable "evidence_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Evidence repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.evidence_repo_git_token_secret_crn, "crn:") || var.evidence_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "evidence_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "evidence_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "evidence_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "evidence_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "evidence_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "evidence_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "evidence_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "evidence_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "evidence_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "evidence_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "evidence_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
  default     = ""
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchains."
  sensitive   = true
}

variable "inventory_group" {
  type        = string
  description = "Specify Git user/group for inventory repo."
  default     = ""
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "inventory_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "inventory_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
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

variable "inventory_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Inventory repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.inventory_repo_git_token_secret_crn, "crn:") || var.inventory_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "inventory_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "inventory_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "inventory_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "inventory_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "inventory_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "inventory_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "inventory_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "inventory_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "inventory_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "inventory_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "inventory_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
  default     = ""
}

variable "issues_group" {
  type        = string
  description = "Specify Git user/group for issues repo."
  default     = ""
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "issues_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "issues_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
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

variable "issues_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Issues repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.issues_repo_git_token_secret_crn, "crn:") || var.issues_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "issues_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "issues_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "issues_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "issues_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "issues_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = true
}

variable "issues_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "issues_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "issues_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "issues_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "issues_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "issues_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
  default     = ""
}

variable "kp_integration_name" {
  type        = string
  description = "The name of the Key Protect integration."
  default     = "kp-compliance-secrets"
}

variable "kp_location" {
  type        = string
  description = "IBM Cloud location/region containing the Key Protect instance."
  default     = "us-south"
}

variable "kp_name" {
  type        = string
  description = "Name of the Key Protect instance where the secrets are stored."
  default     = "kp-compliance-secrets"
}

variable "kp_resource_group" {
  type        = string
  description = "The resource group containing the Key Protect instance for your secrets."
  default     = "Default"
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOps Insights instance in another toolchain, true or false."
  type        = bool
  default     = false
}

variable "pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CC Toolchain."
  default     = "open-v10"
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify Git user/group for pipeline config repo."
  default     = ""
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "pipeline_config_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "Specify a branch of a repository to clone that contains a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "Specify a repository to clone that contains a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "Specify a repository containing a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
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

variable "pipeline_config_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Pipeline Config repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_config_repo_git_token_secret_crn, "crn:") || var.pipeline_config_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_config_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "pipeline_config_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "pipeline_config_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "pipeline_config_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "pipeline_config_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "pipeline_config_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "pipeline_config_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "pipeline_config_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_config_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "pipeline_config_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "pipeline_doi_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the pipeline DOI apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_doi_api_key_secret_crn, "crn:") || var.pipeline_doi_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_doi_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_doi_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance."
  default     = ""
}

variable "pipeline_git_tag" {
  type        = string
  description = "The GIT tag within the CC pipeline definitions repository for Compliance CC Toolchain."
  default     = ""
}

variable "pipeline_ibmcloud_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the IBMCloud apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_ibmcloud_api_key_secret_crn, "crn:") || var.pipeline_ibmcloud_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_ibmcloud_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "pipeline_properties_filepath" {
  type        = string
  description = "The path to the file containing the property JSON. If this is not set, it will by default read the `properties.json` file at the root of the module."
  default     = ""
}

variable "pipeline_properties" {
  type        = string
  description = "Stringified JSON containing the properties. This takes precedence over the properties JSON."
  default     = ""
}

variable "repositories_prefix" {
  type        = string
  description = "Prefix name for the cloned compliance repos."
  default     = "compliance"
}

variable "repository_properties_filepath" {
  type        = string
  description = "The path to the file containing the repository and triggers JSON. If this is not set, it will by default read the `repositories.json` file at the root of the module."
  default     = ""
}

variable "repository_properties" {
  type        = string
  description = "Stringified JSON containing the repositories and triggers. This takes precedence over the repositories JSON."
  default     = ""
}

variable "scc_attachment_id" {
  type        = string
  description = "An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_enable_scc" {
  type        = bool
  description = "Enable the SCC integration."
  default     = true
}

variable "scc_instance_crn" {
  type        = string
  description = "The Security and Compliance Center service instance CRN (Cloud Resource Name). This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. The value must match the regular expression."
  default     = ""
}

variable "scc_integration_name" {
  type        = string
  description = "The name of the SCC integration name."
  default     = "Security and Compliance"
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

variable "scc_scc_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for SCC apikey."
  default     = ""
  validation {
    condition     = startswith(var.scc_scc_api_key_secret_crn, "crn:") || var.scc_scc_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "scc_scc_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the Security and Compliance tool secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "scc_scc_api_key_secret_name" {
  type        = string
  description = "The Security and Compliance Center api-key secret in the secret provider."
  default     = "scc-api-key"
}

variable "scc_use_profile_attachment" {
  type        = string
  description = "Set to `enabled` to enable use profile with attachment, so that the scripts in the pipeline can interact with the Security and Compliance Center service. When enabled, other parameters become relevant; `scc_scc_scc_api_key_secret_name`, `scc_instance_crn`, `scc_profile_name`, `scc_profile_version`, `scc_attachment_id`."
  default     = "disabled"
}

variable "slack_channel_name" {
  type        = string
  description = "The Slack channel that notifications will be posted to."
  default     = "my-channel"
}

variable "slack_integration_name" {
  type        = string
  description = "The name of the Slack integration."
  default     = "slack-compliance"
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

variable "slack_team_name" {
  type        = string
  description = "The Slack team name, which is the word or phrase before .slack.com in the team URL."
  default     = "my-team"
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

variable "slack_webhook_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for Slack Webhook secret."
  default     = ""
  validation {
    condition     = startswith(var.slack_webhook_secret_crn, "crn:") || var.slack_webhook_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "slack_webhook_secret_group" {
  type        = string
  description = "Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "sm_instance_crn" {
  type        = string
  description = "The CRN of the Secrets Manager instance."
  default     = ""
}

variable "sm_integration_name" {
  type        = string
  description = "The name of the Secrets Manager integration."
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance."
  default     = "us-south"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored. Not required if using a Secrets Manager CRN instance."
  default     = "sm-compliance-secrets"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance for your secrets. Not required if using a Secrets Manager CRN instance."
  default     = "Default"
}

variable "sm_secret_group" {
  type        = string
  description = "Group in Secrets Manager for organizing/grouping secrets."
  default     = "Default"
}

variable "sonarqube_integration_name" {
  type        = string
  description = "The name of the SonarQube integration."
  default     = "SonarQube"
}

variable "sonarqube_is_blind_connection" {
  type        = string
  description = "When set to `true`, instructs IBM Cloud Continuous Delivery to not validate the configuration of this integration. Set this to true if the SonarQube server is not addressable on the public internet."
  default     = true
}

variable "sonarqube_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the SonarQube secret."
  default     = ""
  validation {
    condition     = startswith(var.sonarqube_secret_crn, "crn:") || var.sonarqube_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "sonarqube_secret_group" {
  type        = string
  description = "Secret group prefix for the SonarQube secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "sonarqube_secret_name" {
  type        = string
  description = "The name of the SonarQube secret."
  default     = "sonarqube-secret"
}

variable "sonarqube_server_url" {
  type        = string
  description = "The URL to the SonarQube server."
  default     = ""
}

variable "sonarqube_user" {
  type        = string
  description = "The name of the SonarQube user."
  default     = ""
}

variable "toolchain_description" {
  type        = string
  description = "Description for the CC Toolchain."
  default     = "Toolchain created with terraform template for DevSecOps CC Best Practices"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the CC Toolchain."
  default     = "DevSecOps CC Toolchain - Terraform"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud region where the toolchain is created"
  default     = "us-south"
}

variable "toolchain_resource_group" {
  type        = string
  description = "Resource group within which the toolchain is created"
  default     = "Default"
}

variable "trigger_manual_enable" {
  type        = bool
  description = "Set to `true` to enable the CC pipeline Manual trigger."
  default     = true
}

variable "trigger_manual_name" {
  type        = string
  description = "The name of the CC pipeline Manual trigger."
  default     = "CC Manual Trigger"
}

variable "trigger_manual_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the manual Pruner trigger."
  default     = true
}

variable "trigger_manual_pruner_name" {
  type        = string
  description = "The name of the manual Pruner trigger."
  default     = "Evidence Pruner Manual Trigger"
}

variable "trigger_timed_cron_schedule" {
  type        = string
  description = "Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *_/2 * * * - every 2 hours."
  default     = "0 4 * * *"
}

variable "trigger_timed_enable" {
  type        = bool
  description = "Set to `true` to enable the CI pipeline Timed trigger."
  default     = false
}

variable "trigger_timed_name" {
  type        = string
  description = "The name of the CC pipeline Timed trigger."
  default     = "CC Timed Trigger"
}

variable "trigger_timed_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the timed Pruner trigger."
  default     = false
}

variable "trigger_timed_pruner_name" {
  type        = string
  description = "The name of the timed Pruner trigger."
  default     = "Evidence Pruner Timed Trigger"
}

variable "worker_id" {
  type        = string
  default     = "public"
  description = "The identifier for the Managed Pipeline worker."
}

variable "repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "repo_git_id" {
  type        = string
  description = "The Git ID for the compliance repositories."
  default     = ""
}

variable "repo_git_provider" {
  type        = string
  description = "The Git provider type."
  default     = ""
}

variable "repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "repo_group" {
  type        = string
  description = "Specify the Git user or group for your application. This must be set if the repository authentication type is `pat` (personal access token)."
  default     = ""
}

variable "repo_git_token_crn" {
  type        = string
  description = "The CRN of the  Git token secret in the secret provider. Specifying a CRN for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider. Specifying a secret name for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_auth_type" {
  type        = string
  description = "The auth type for the repo `oauth` or 'pat` (personal access token). Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}

variable "repo_integration_owner" {
  type        = string
  description = "The integration owner of the repository. Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}
