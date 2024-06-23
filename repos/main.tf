

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraformdev"  
    storage_account_name = "terraformstoredev"                      
    container_name       = "terraformcontainer"                       
    key                   = "x.tfstate"
    }
}

provider "azurerm" {
 features {}
}