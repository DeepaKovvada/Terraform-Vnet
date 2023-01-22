
resource "azurerm_resource_group" "example" {
  name     = "vnetrg1"
  location = "canada central"
}


resource "azurerm_virtual_network" "example" {
  name                = "vnet01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  subnet {
    name           = "subnet01"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet02"
    address_prefix = "10.0.2.0/24"
    
  }

  tags = {
    environment = "Production"
  }
}
