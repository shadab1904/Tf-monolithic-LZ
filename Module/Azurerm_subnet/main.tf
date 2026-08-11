resource "azurerm_subnet" "subnet_ericsson_airtel" {
  for_each             = var.subnet_airtel
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.addpref
}