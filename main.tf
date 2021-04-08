terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

variable "personal_access_token" {
}

provider "azuredevops" {
	org_service_url = "https://dev.azure.com/jasonouellet"
	personal_access_token = var.personal_access_token
}

resource "azuredevops_project" "project" {
  name       = "IaC_Exemple_Project"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

/*
resource "azuredevops_serviceendpoint_github" "github_serviceendpoint" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "GitHub Service Connection"
  auth_oauth {
    oauth_configuration_id = "00000000-0000-0000-0000-000000000000"
  }
}
*/

/*
resource "azuredevops_build_definition" "nightly_build" {
  project_id      = azuredevops_project.project.id
  agent_pool_name = "Hosted Ubuntu 1604"
  name            = "Compilation .NET"
  path            = "\\"

  repository {
    repo_type             = "GitHub"
    repo_id               = "microsoft/terraform-provider-azuredevops"
    branch_name           = "master"
    yml_path              = ".azdo/azure-pipeline-nightly.yml"
    service_connection_id = azuredevops_serviceendpoint_github.github_serviceendpoint.id
  }
}
*/
