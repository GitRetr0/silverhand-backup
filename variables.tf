variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "sre-first-vm"
}

variable "ssh_public_key_path" {
  description = "Шлях до вашого SSH public key файлу"
  type        = string
  default     = "/Users/ivanberezii/.ssh/id_rsa_azure.pub"
}


variable "vm_size" {
  description = "Розмір VM (SKU)"
  type        = string
  default     = "Standard_B2as_v2"
}

variable "allowed_ssh_cidr" {
  description = "CIDR для доступу по SSH (ваш IP/32)"
  type        = string
  default     = "YOUR.IP.ADD.RESS/32"
}
