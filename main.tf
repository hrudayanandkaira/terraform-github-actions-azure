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
  #ARM_CLIENT_ID = "e0a00b23-781d-47fc-88aa-0aeeef24fb8a"     #"${{ secrets.AZURE_CLIENT_ID }}"
  #ARM_SUBSCRIPTION_ID =  "e520db69-a509-4dbf-9480-fa7a46560ac1"    #"${{ secrets.AZURE_SUBSCRIPTION_ID }}"
  #ARM_TENANT_ID = "9f2a5891-22b8-4308-92fa-fdef45ffb338"    #"${{ secrets.AZURE_TENANT_ID }}"

  features {}
  #use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
