module "resource_group" {
  source    = "../../Module/Azurerm_resource_group"
  rg_airtel = var.rgs

}

module "virtual_network" {
  source      = "../../Module/Azurerm_Vnet"
  vnet_airtel = var.vnets
  depends_on  = [module.resource_group]
}

module "subnet" {
  source        = "../../Module/Azurerm_subnet"
  subnet_airtel = var.subnets
  depends_on    = [module.virtual_network]

}

module "nsg" {
  source     = "../../Module/Azurerm_nsg"
  nsg_airtel = var.nsgs
  depends_on = [module.nic]
}

module "pip" {
  source     = "../../Module/Azurerm_pip"
  pip_airtel = var.pip
  depends_on = [module.resource_group]

}

module "nic" {
  source     = "../../Module/Azurerm_nic"
  nic_airtel = var.nics
  depends_on = [module.subnet, module.pip]

}

module "vm" {
  source     = "../../Module/Azurerm_vm"
  vm_airtel  = var.vms
  depends_on = [module.nic, module.keyvault]

}

module "keyvault" {
  source          = "../../Module/Azurerm_keyvault"
  keyvault_airtel = var.keyvault
  depends_on      = [module.resource_group]
}