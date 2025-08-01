output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "backup_storage_account_name" {
  value = azurerm_storage_account.backup.name
}

output "backup_storage_key" {
  value     = azurerm_storage_account.backup.primary_access_key
  sensitive = true
}
