module "resource_group" {
  source      = "../../Module/Azurerm_resource_group"
  rg_pahariya = var.vms

}

module "virtual_network" {
  source        = "../../Module/Azurerm_Vnet"
  vnet_pahariya = var.vms
  depends_on    = [module.resource_group]
}

module "subnet" {
  source          = "../../Module/Azurerm_subnet"
  subnet_pahariya = var.vms
  depends_on      = [module.virtual_network]

}

module "nsg" {
  source       = "../../Module/Azurerm_nsg"
  nsg_pahariya = var.vms
  depends_on   = [module.nic]
}

module "pip" {
  source     = "../../Module/Azurerm_pip"
  pip        = var.vms
  depends_on = [module.resource_group]

}

module "nic" {
  source       = "../../Module/Azurerm_nic"
  nic_pahariya = var.vms
  depends_on   = [module.subnet, module.pip]

}

module "vm" {
  source      = "../../Module/Azurerm_vm"
  vm_pahariya = var.vms
  depends_on  = [module.nic]

}