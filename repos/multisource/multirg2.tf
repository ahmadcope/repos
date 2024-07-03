resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vn-2" {
  name                =  "baigvnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  
  tags = local.common_tags

}


resource "azurerm_subnet" "sub3" {
  name                 =  "vmsubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.vn-2.name
  address_prefixes     = ["10.0.3.0/24"]

}


output "subnet_id" {
  value       = azurerm_subnet.sub3.id

}

locals {
  common_tags = {
  "fm_az_businessUnit" = "sf"
  "Environment" = "dev"
  "fm_az_dCatalogue" = "F599"
  }
}

