


resource "azurerm_resource_group" "myrg-4" {
  name     = var.resourcegroup_name
  location = var.location
   
}

resource "azurerm_virtual_network" "vn-2" {
  name                = var.vnet_name
  location            = azurerm_resource_group.myrg-4.location
  resource_group_name = azurerm_resource_group.myrg-4.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]


  }

resource "azurerm_subnet" "sub3" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.myrg-4.name
  virtual_network_name = azurerm_virtual_network.vn-2.name
  address_prefixes     = ["10.0.3.0/24"]
  
  
  lifecycle {
    ignore_changes = [address_prefixes]
  }  
}


