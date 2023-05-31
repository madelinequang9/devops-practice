variable "vmname" {
    type = string
    description = "Name of VM"
}

variable "location" {
    type = string
    description = "Azure Location"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "subnet_name" {
    type = string
    description = "Name of the subnet"
}

variable "subnet_id" {
    type = string
    description = "id of subnet"
}

variable "network_int_count" {
    type = number
    description = "Number of network interface"
}