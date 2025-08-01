#connecting to the existing rg
data "azurerm_resource_group" "backup_rg" {
  name = "rg-euw-tfstate"
}
#unique suffix for the storage account to avoid conflicts
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  lower   = true
  numeric = true
  special = false
}
#SA for backups
resource "azurerm_storage_account" "backup" {
  name                     = "silverhandsa${random_string.suffix.result}"
  resource_group_name      = data.azurerm_resource_group.backup_rg.name
  location                 = data.azurerm_resource_group.backup_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    purpose = "vm-backup"
    owner   = "Ivan Berezii"
  }
}
#container for storing VHDs or snapshots
resource "azurerm_storage_container" "backups" {
  name                  = "vm-backups"
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = "private"
}

#container for storing tfstate
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = "private"
}

