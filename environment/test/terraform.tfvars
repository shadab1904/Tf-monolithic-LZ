vms = {
  rg_pahariya = {
    rg1 = {
      name       = "egi_rg"
      location   = "swedencentral"
      managed_by = "azmaira"
    }
  }

  vnet_pahariya = {
    vnet1 = {
      vnet_name = "vnet_varanasi"
      location  = "swedencentral"
      rg_name   = "essjayericsson_rg"
      addspc    = ["10.67.0.0/16"]
    }
  }

  subnet_pahariya = {
    subnet_fe = {
      name      = "frontend_subnet"
      rg_name   = "essjayericsson_rg"
      vnet_name = "vnet_varanasi"
      addpref   = ["10.67.1.0/24"]
    }

    subnet_be = {
      name      = "backend_subnet"
      rg_name   = "essjayericsson_rg"
      vnet_name = "vnet_varanasi"
      addpref   = ["10.67.5.0/24"]
    }
  }

  nic_pahariya = {
    nic_fe = {
      name        = "nic_pandeypur"
      location    = "swedencentral"
      rg_name     = "essjayericsson_rg"
      nic_ipname  = "dev_feip"
      vnet_name   = "vnet_varanasi"
      subnet_name = "frontend_subnet"
      pipname    = "Frontend_pippandeypur"
    }
    nic_be = {
      name        = "nic_chawkaghat"
      location    = "swedencentral"
      rg_name     = "essjayericsson_rg"
      nic_ipname  = "dev_beip"
      vnet_name   = "vnet_varanasi"
      subnet_name = "backend_subnet"
      pipname    = "backend_pipchawkaghat"
    }
  }

  pip = {
    pipfe = {
      pipname  = "Frontend_pippandeypur"
      rg_name  = "essjayericsson_rg"
      location = "swedencentral"
      allmeth  = "Static"
    }
    pipbe = {
      pipname  = "backend_pipchawkaghat"
      rg_name  = "essjayericsson_rg"
      location = "swedencentral"
      allmeth  = "Static"
    }
  }
  nsg_pahariya = {
    nsg1 = {
      name      = "pandeypur"
      location  = "swedencentral"
      rg_name   = "essjayericsson_rg"
      sr_name   = "nsg_sr1"
      priority  = 100
      direction = "Inbound"
      access    = "Allow"
      protocol  = "Tcp"
      spr       = "*"
      dpr       = ["80", "443"]
      sap       = "*"
      dap       = "*"
      nic_name  = "nic_pandeypur"
    }
    nsg2 = {
      name      = "chowkaghat"
      location  = "swedencentral"
      rg_name   = "essjayericsson_rg"
      sr_name   = "nsg_sr2"
      priority  = 100
      direction = "Inbound"
      access    = "Allow"
      protocol  = "Tcp"
      spr       = "*"
      dpr       = ["80", "443"]
      sap       = "*"
      dap       = "*"
      nic_name  = "nic_chawkaghat"
    }
  }

  vm_pahariya = {
    vm_fe = {
      vm_name           = "fe_pandeypur"
      location          = "swedencentral"
      rg_name           = "essjayericsson_rg"
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
      admin_password    = "Shysha@19042025!"
      nic_name          = "nic_pandeypur"


    }
    vm_be = {
      vm_name           = "be_pandeypur"
      location          = "swedencentral"
      rg_name           = "essjayericsson_rg"
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
      admin_password    = "Shysha@19042025"
      nic_name          = "nic_chawkaghat"
    }
  }

}