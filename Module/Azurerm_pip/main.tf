resource "azurerm_public_ip" "pip_ericsson_airtel" {
  for_each            = var.pip_airtel
  name                = each.value.pipname
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allmeth
}