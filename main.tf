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
#version = "2.34.0"
 tenant_id = env.ARM_TENANT_ID
  #use_azurecli = true
  client_id      = env.ARM_CLIENT_ID
  client_secret = env.ARM_CLIENT_SECRET
  #tenant_id      = env.ARM_TENANT_ID
  subscription_id = env.ARM_SUBSCRIPTION_ID
  features {}
  #use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
