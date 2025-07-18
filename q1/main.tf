# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {  
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "sre-challenge-flaschenpost" {
  name     = var.resourceGroupName
  location = var.location
  tags = {
    "var.resourceGroupTagKey" = var.resourceGroupTagValue
  }
}