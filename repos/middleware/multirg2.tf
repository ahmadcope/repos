
data "terraform_remote_state" "vnet_subnet" {
  backend = "local"
  config = {
    path =  "C:/Users/arshad/source/multilayerterraform/multisource/level-0.tfstate"
  }
}


resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = "westeurope"
  resource_group_name = "example-resources"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.terraform_remote_state.vnet_subnet.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags

}





locals {
  common_tags = {
  "fm_az_businessUnit" = "sf"
  "Environment" = "dev"
  "fm_az_dCatalogue" = "F599"
  }
}

