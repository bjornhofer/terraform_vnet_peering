variable "vnet_peering_destination_vnet" {
  type = string
  description = "ID of the destination VNET"
}

variable "vnet_peering_source_vnet" {
  type = string
  description = "ID of the source VNET"
}

variable "vnet_peering_name" {
  type = string
  description = "name of the peering"
  default = "peering"
}

variable "vnet_peering_resource_group" {
  type = string
  description = "Resource Group for the peering"
}

variable "allow_virtual_network_access" {
  type = bool
  default = true
}

variable "allow_forwarded_traffic" {
  type = bool
  default = true
}

variable "allow_gateway_transit" {
  type = bool
  default = true
}

variable "dbg_simulate" {
  type        = bool
  default     = false
  description = "DEBUG: simulate creation | default: false | true = simulate creation, false = do not simulate creation"
}