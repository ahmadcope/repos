provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
  backend "local" {
    path = "C:/Users/arshad/source/multilayerterraform/middleware/level-0.tfstate"
  }  
}

