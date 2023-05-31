variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
    type = string
    description = "Location of deployment"
}

variable "network_interface_ids" {
  type = list(string)
  description = "Azure location"
}

variable "count" {
    type = number
    description = "Number of VMs"
}