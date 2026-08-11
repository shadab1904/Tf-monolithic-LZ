terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "msc_airtelrg1"
    storage_account_name = "switchpahariya19"
    container_name       = "pahariyamsc"
    key                  = "vm.terraform.tfstate"

  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
