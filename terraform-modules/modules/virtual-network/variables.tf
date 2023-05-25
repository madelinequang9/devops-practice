variable "virtual_network_name" {
    type = string
    description = "Name of virtual network"
}

variable "resource_group_name" {
    type = string
    description = "Name of resource group"
}

variable "virtual_network_address_space" {
    type = list(string)
    description = "Address space of the virtual network"
}

variable "location" {
    type = string
    description = "location of the virtual network"
}

variable "subnet_name" {
    type = string
    description = "Name of the subnet"
}

variable "subnet_prefix" {
    type = string
    description = "Subnet address prefix"
}