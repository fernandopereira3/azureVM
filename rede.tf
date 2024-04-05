resource "azurerm_virtual_network" "redeDev" {
  name                = "redeDev"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.desenvolvimento.location
  resource_group_name = azurerm_resource_group.desenvolvimento.name
}

resource "azurerm_subnet" "subDev-001" {
  name                 = "subDev-001"
  resource_group_name  = azurerm_resource_group.desenvolvimento.name
  virtual_network_name = azurerm_virtual_network.redeDev.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "default01" {
  name                = "default01"
  location            = azurerm_resource_group.desenvolvimento.location
  resource_group_name = azurerm_resource_group.desenvolvimento.name

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = azurerm_subnet.subDev-001.id
    private_ip_address_allocation = "Dynamic"
  }
}