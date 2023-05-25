resource "azurerm_network_interface" "nic" {
  count               = 3
  name                = "myNIC${count.index}"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name

  ip_configuration {
    name                          = "azurerm_subnet.subnet.id"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}