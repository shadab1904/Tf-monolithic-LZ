keyvault = {
  kv1 = {
    keyvault_name  = "kv-varanasi"
    rg_name        = "Varanasi_rg"
    location       = "swedencentral"
    keyvault_sdrd  = 7
    keyvault_ppe   = false
    keyvault_sku   = "standard"
  }

}

rgs = {
  rg1 = {
    rg_name  = "Varanasi_rg"
    location = "swedencentral"
  managed_by = "azmaira" }
}

vnets = {
  vnet1 = {
    vnet_name = "vnet_varanasi"
    rg_name   = "Varanasi_rg"
    location  = "swedencentral"
    addspc    = ["10.67.0.0/16"]

  }
}

subnets = {
  subnet_fe = {
  subnet_name = "frontend_subnet_pahariya"
  rg_name = "Varanasi_rg" 
  vnet_name = "vnet_varanasi"
  addpref           = ["10.67.1.0/24"]
  }

  subnet_be = {
  subnet_name       = "backend_subnet_pahariya"
  rg_name = "Varanasi_rg" 
  vnet_name = "vnet_varanasi"
  addpref           = ["10.67.5.0/24"]
  }
}

nics = {
  nic_fe = {
    nic_name = "nic_pandeypur"
    location = "swedencentral"
    rg_name = "Varanasi_rg"
    nic_ipname = "dev_feip"
     pipname           = "Frontend_pippandeypur"
    vnet_name = "vnet_varanasi"
    subnet_name = "frontend_subnet_pahariya"
  }

    nic_be = {
    nic_name          = "nic_chawkaghat"
    location = "swedencentral"
    rg_name = "Varanasi_rg"
        nic_ipname = "dev_beip"
    pipname ="backend_pipchawkaghat"
    vnet_name = "vnet_varanasi"
    subnet_name = "backend_subnet_pahariya"
  }
}

nsgs = {
  nsg_fe = {
    nsg_name = "pandeypur"
        location = "swedencentral"
    rg_name = "Varanasi_rg"
    sr_name           = "nsg_sr1"
    nsg_priority      = 100
    nsg_direction     = "Inbound"
    nsg_access        = "Allow"
    nsg_protocol      = "Tcp"
    nsg_spr           = "*"
    nsg_dpr           = ["80", "443"]
    nsg_sap           = "*"
    nsg_dap           = "*"
    nic_name = "nic_pandeypur"
  }

  nsg_be ={
    location = "swedencentral"
    rg_name = "Varanasi_rg"
    nsg_name          = "chowkaghat"
    sr_name           = "nsg_sr2"
    nsg_priority      = 100
    nsg_direction     = "Inbound"
    nsg_access        = "Allow"
    nsg_protocol      = "Tcp"
    nsg_spr           = "*"
    nsg_dpr           = ["80", "443"]
    nsg_sap           = "*"
    nsg_dap           = "*"
nic_name          = "nic_chawkaghat"
  }
}

pip = {
  pip_fe = {
    allmeth ="Static"
    rg_name = "Varanasi_rg"
    location ="swedencentral"
    pipname = "Frontend_pippandeypur"
  }

    pip_be = {
    allmeth ="Static"
    rg_name = "Varanasi_rg"
    location ="swedencentral"
    pipname = "backend_pipchawkaghat"
  }
}


vms = {
  vm_frontend = {
    rg_name           = "Varanasi_rg"
    location          = "swedencentral"
    vm_name           = "fe_pahariya"
    vmsize            = "Standard_D2ads_v5"
    stgpublisher      = "Canonical"
    stgoffer          = "0001-com-ubuntu-server-jammy"
    stgsku            = "22_04-lts"
    stgversion        = "latest"
    stgos_name        = "myosdisk1"
    stgoscaching      = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    computer_name     = "hostname"
    admin_username    = "adminazmaira"
    keyvault_name     = "kv-varanasi"
nic_name ="nic_pandeypur"


  }

  vm_backend = {
    rg_name           = "Varanasi_rg"
    location          = "swedencentral"
    vm_name           = "be_pahariya"
    vmsize            = "Standard_D2s_v3"
    stgpublisher      = "Canonical"
    stgoffer          = "0001-com-ubuntu-server-jammy"
    stgsku            = "22_04-lts"
    stgversion        = "latest"
    stgos_name        = "myosdisk2"
    stgoscaching      = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    computer_name     = "hostname"
    admin_username    = "adminazmaira"
    keyvault_name     = "kv-varanasi"
nic_name = "nic_chawkaghat"

  }
}