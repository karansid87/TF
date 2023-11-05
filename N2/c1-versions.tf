# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstate5"
    container_name = "tfstatefiles"
    key = "tf-New7.tfstate"
  }
}

# Provider Block
provider "azurerm" {
 skip_provider_registration = true
 features {}          
}

# Random String Resource
resource "random_string" "myrandom" {
  for_each = var.environment
  length = 6
  upper = false 
  special = false
  number = false   
}


