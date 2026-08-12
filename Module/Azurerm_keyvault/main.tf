data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault_ericsson_airtel" {
  for_each                   = var.keyvault_airtel
  name                       = each.value.keyvault_name
  location                   = each.value.location
  resource_group_name        = each.value.rg_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = each.value.keyvault_sdrd
  purge_protection_enabled   = each.value.keyvault_ppe
  sku_name                   = each.value.keyvault_sku

  enable_rbac_authorization = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
  }

}

resource "azurerm_key_vault_secret" "vm_admin_password" {
  for_each = var.keyvault_airtel

  name         = "vm-admin-password"
  value        = var.vm_admin_password
  key_vault_id = azurerm_key_vault.keyvault_ericsson_airtel[each.key].id
}




