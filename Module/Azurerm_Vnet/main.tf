resource "azurerm_virtual_network" "vnet_ericsson_airtel" {
  for_each = var.vnet_airtel
  name = each.value.vnet_name
  resource_group_name = each.value.rg_name 
  location = each.value.location
  address_space = each.value.addspc 
}