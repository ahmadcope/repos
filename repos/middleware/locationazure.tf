resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.location


}

resource "azurerm_virtual_network" "vn-2" {
  name                =  "baigvnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  
  

}




