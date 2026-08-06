resource "azurerm_network_security_group" "nsg_ericsson_airtel" {
    for_each = var.nsg_airtel
 name = each.value.nsg_name
 location = each.value.location
resource_group_name = each.value.rg_name 

  security_rule {
    name                       = each.value.sr_name
    priority                   = each.value.nsg_priority
    direction                  = each.value.nsg_direction
    access                     = each.value.nsg_access
    protocol                   = each.value.nsg_protocol
    source_port_range          = each.value.nsg_spr
    destination_port_ranges     = each.value.nsg_dpr
    source_address_prefix      = each.value.nsg_sap
    destination_address_prefix = each.value.nsg_dap
  }
}

data "azurerm_network_interface" "nsgnic" {
  for_each = var.nsg_airtel
  name = each.value.nic_name
  resource_group_name = each.value.rg_name
  
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.nsg_airtel
  network_interface_id      = data.azurerm_network_interface.nsgnic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_ericsson_airtel[each.key].id

}