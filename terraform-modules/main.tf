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

  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_address_space = var.virtual_network_address_space
  subnet_name = var.subnet_name
  subnet_prefix = var.subnet_prefix
}

module "vm" {
    source = "./modules/vm"
    resource_group_name = var.resource_group_name
    location = var.location
}
