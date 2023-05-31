variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
    type = string
    description = "Location of deployment"
}

variable "vmname" {
  type = string
  description = "Name of VM"
}

variable "network_interface_ids" {
  type = list(string)
  description = "UDs of network interface"
}

variable "vm_count" {
    type = number
    description = "Number of VMs"
}