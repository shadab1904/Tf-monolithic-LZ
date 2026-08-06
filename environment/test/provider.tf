terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "msc_patliputrarg"
    storage_account_name = "switchpatliputra"
    container_name       = "airtel"
    key                  = "vm.terraform.tfstate"

  }
}

provider "azurerm" {
  features {}

}