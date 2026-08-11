data "azurerm_network_interface" "nic_id" {
  for_each            = var.vm_airtel
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "keyvault_id" {
  for_each            = var.vm_airtel
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.vm_airtel
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.keyvault_id[each.key].id
}

resource "azurerm_virtual_machine" "vm_ericsson_airtel" {
  for_each              = var.vm_airtel
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [data.azurerm_network_interface.nic_id[each.key].id]
  vm_size               = each.value.vmsize


  storage_image_reference {
    publisher = each.value.stgpublisher
    offer     = each.value.stgoffer
    sku       = each.value.stgsku
    version   = each.value.stgversion
  }
  storage_os_disk {
    name              = each.value.stgos_name
    caching           = each.value.stgoscaching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = data.azurerm_key_vault_secret.password[each.key].value
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}