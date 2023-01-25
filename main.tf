resource "azurerm_virtual_network_peering" "main" {
  count                        = var.dbg_simulate ? 0:1
  name                         = var.peering_name == "peering" ? "peering-${split("/", var.source_vnet)[7]}_${split("/", var.destination_vnet)[7]}" : var.peering_name
  resource_group_name          = var.resource_group
  virtual_network_name         = var.source_vnet
  remote_virtual_network_id    = var.destination_vnet
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic 
  allow_gateway_transit = var.allow_gateway_transit
}