terraform {
  required_version = ">= 1.6.0"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}