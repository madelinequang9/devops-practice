variable "resource_group_name" {
    type = string
    description = "Resource group name of the virtual network"
}

variable "location" {
    type = string
    description = "Location of virtual network"
}

variable "virtual_network_name" {
    type = string
    description = "Name of the virtual network"
}

variable "virtual_network_address_space" {
    type = list(string)
    description = "Address space of the virtual network"
}

variable "subnet_name" {
    type = string
    description = "name of the subnet"
}

variable "subnet_prefix" {
    type = string
    description = "Address prefix of the subnet"
}

variable "res_count" {
    type = number
    description = "Number of resources"
}