data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault_ericsson_airtel" {
    for_each = var.keyvault_airtel
  name                        = each.value.keyvault_name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.keyvault_sdrd
  purge_protection_enabled    = each.value.keyvault_ppe
  sku_name = each.value.keyvault_sku

 rbac_authorization_enabled = true

}

resource "azurerm_role_assignment" "kv" {
for_each = var.keyvault_airtel
  scope                = azurerm_key_vault.keyvault_ericsson_airtel[each.key].id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.azurerm_client_config.current.object_id

}



