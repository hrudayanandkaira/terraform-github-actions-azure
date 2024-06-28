terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
/*
  # Update this block with the location of your terraform state file
   backend "azurerm" {
    resource_group_name  = "azureautomation-rg"
    storage_account_name = "tfstorageaccx"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true

  } */
}

provider "azurerm" {
  ARM_CLIENT_ID =  "${{secrets.AZURE_CLIENT_ID}}"
  ARM_SUBSCRIPTION_ID = "${{secrets.AZURE_SUBSCRIPTION_ID}}"
  ARM_TENANT_ID  = "${{secrets.AZURE_TENANT_ID}}"
  ARM_CLIENT_SECRET  = "${{secrets.AZURE_CLIENT_SECRET}}"
  #client_id       = "c586ee23-af11-497c-8b73-22e8b785dda5"
  #client_secret   = ""
  #client_secret: "${{secrets.client_secret}}"
  #tenant_id       = "9f2a5891-22b8-4308-92fa-fdef45ffb338"
  #subscription_id = "e520db69-a509-4dbf-9480-fa7a46560ac1"
  features {}
 # use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
