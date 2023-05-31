resource "azurerm_managed_disk" "disk" {
  count                = var.vm_count
  name                 = "datadisk_existing_${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "100"
}

resource "azurerm_availability_set" "avset" {
  name                         = "avset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.vm_count
  platform_update_domain_count = var.vm_count
  managed                      = true
}

resource "azurerm_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = "${var.vmname}_${count.index}"
  location              = var.location
  availability_set_id   = azurerm_availability_set.avset.id
  resource_group_name   = var.resource_group_name
  //network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]
  network_interface_ids = var.network_interface_ids[count.index]
  vm_size               = "Standard_DS1_V2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk_${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name            = element(azurerm_managed_disk.disk.*.name, count.index)
    managed_disk_id = element(azurerm_managed_disk.disk.*.id, count.index)
    create_option   = "Attach"
    lun             = 1
    disk_size_gb    = element(azurerm_managed_disk.disk.*.disk_size_gb, count.index)
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "testAdmin1"
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }

  tags = {
    environment = "staging"
  }
}