resource "azurerm_resource_group" "rg_ericsson_airtel" {
for_each = var.rg_airtel
name = each.value.rg_name
location = each.value.location
managed_by = each.value.managed_by

}