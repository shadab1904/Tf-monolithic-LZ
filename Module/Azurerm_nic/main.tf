resource "azurerm_network_interface" "nic_ericsson_airtel" {
  for_each            = var.nic_airtel
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.nic_ipname
    subnet_id                     = data.azurerm_subnet.subnet_id[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip_id[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "subnet_id" {
  for_each             = var.nic_airtel
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "pip_id" {
  for_each            = var.nic_airtel
  name                = each.value.pipname
  resource_group_name = each.value.rg_name
}