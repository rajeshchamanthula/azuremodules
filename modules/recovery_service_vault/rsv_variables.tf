
variable "azurerm_recovery_services_vault_rsv_name" {
    description = "The name of the Recovery Service Vault"
    type        = string
}
variable "azurerm_recovery_services_vault_sku" {
    description = "Recovery Service Vault SKU"
    type        = string
}

variable "azurerm_recovery_services_vault_storage_mode" {
    description = "Recovery Service Vault Storage Mode"
    type        = string
}

variable "azurerm_recovery_services_vault_soft_delete" {
    description = "Recovery Service Vault Soft delete enable"
    type        = bool
}

variable "azurerm_backup_policy_vm_name" {
    description = "The name of the Backup Policy"
    type        = string
}

variable "azurerm_backup_policy_vm_timezone" {
    description = "Backup Policy Time Zone"
    type        = string
}
variable "rg" {
  description = "Name of the existing Compute Resource Group"
  type        = string
}
variable "location" {
  description = "	The name of the Location"
  type = string
}
variable "tags" {
  
}
variable "source_vm_id" {
 
}
 

variable "vm_rg" {
  
}