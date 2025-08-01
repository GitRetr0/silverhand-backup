terraform {
  backend "azurerm" {
    resource_group_name  = "rg-euw-tfstate"
    storage_account_name = "silverhandsa478n"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}