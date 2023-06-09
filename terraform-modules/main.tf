terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.12.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev" {
  name     = var.resource_group_name
  location = var.location
}

module "virtual-network" {
  source = "./modules/virtual-network"

  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_name = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name = var.subnet_name
  subnet_prefix = var.subnet_prefix
}

module "network-interface" {
  source = "./modules/network-interface"

  vmname = var.vmname
  location = var.location
  resource_group_name = var.resource_group_name
  subnet_name = var.subnet_name
  subnet_id = module.virtual-network.subnet_id
  network_int_count = var.res_count
}

module "linux-vm" {
    source = "./modules/linux-vm"

    resource_group_name = var.resource_group_name
    location = var.location
    vmname = var.vmname
    network_interface_ids = module.network-interface.nic_id
    vm_count = var.res_count
}
