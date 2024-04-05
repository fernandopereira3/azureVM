resource "azurerm_virtual_machine" "VMdev001" {
  name                  = "VMdev001"
  location              = azurerm_resource_group.desenvolvimento.location
  resource_group_name   = azurerm_resource_group.desenvolvimento.name
  network_interface_ids = [azurerm_network_interface.default01.id]
  vm_size               = "Standard_D8s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "server"
    admin_username = "ubuntu"
    #falha de segurança! mas este .tf é somente para exemplo
    admin_password = "#123adminPassword"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "Testes"
  }

}

