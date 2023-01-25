resource "azurerm_virtual_network_peering" "source2dest" {
  count                        = var.dbg_simulate ? 0:1
  name                         = var.vnet_peering_name == "peering" ? "peering-${split("/", var.vnet_peering_source_vnet)[8]}_${split("/", var.vnet_peering_destination_vnet)[8]}" : var.vnet_peering_name
  resource_group_name          = split("/", var.vnet_peering_source_vnet)[4]
  virtual_network_name         = split("/", var.vnet_peering_source_vnet)[8]
  remote_virtual_network_id    = var.vnet_peering_destination_vnet
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic 
  allow_gateway_transit = var.allow_gateway_transit
}

resource "azurerm_virtual_network_peering" "dest2main" {
  count                        = var.dbg_simulate ? 0:1
  name                         = var.vnet_peering_name == "peering" ? "peering-${split("/", var.vnet_peering_destination_vnet)[8]}_${split("/", var.vnet_peering_source_vnet)[8]}" : var.vnet_peering_name
  resource_group_name          = split("/", var.vnet_peering_destination_vnet)[4]
  virtual_network_name         = split("/", var.vnet_peering_destination_vnet)[8]
  remote_virtual_network_id    = var.vnet_peering_source_vnet
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic 
  allow_gateway_transit = var.allow_gateway_transit
}