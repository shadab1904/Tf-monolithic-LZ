terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "msc_airtelrg"
    storage_account_name = "switchpahariya1"
    container_name       = "pahariya"
    key                  = "vmfe.terraform.tfstate"

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