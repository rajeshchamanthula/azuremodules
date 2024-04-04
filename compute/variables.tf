variable "location" {
  description = "This is the location to deploy resources"
}

variable "env" {
  description = "Productive environment type. Possible values: pro, pre, dev, int, qa, dr"
}
variable "client" {
  description = "The name of the client"
}

variable "rg" {

  description = "This is the resource group name under the objects will be created"
}
variable "address_space" {

  description = "This is the Address space to be created in the vnet"
}

variable "subnets" {

  description = "This is the subnet address created "
}

variable "storageaccount" {
  description = "This is the storage account for boot diag"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number

}

variable "vm_username" {
  description = "Username for the VMs"
  type        = string

}

variable "vm_name" {
}

variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string

}

variable "private_ip_address" {
  description = "The base private IP address for the virtual machines. Each VM will be suffixed with a number."
  type        = string

}

variable "storage_image_reference" {
  description = "Storage image reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "azure_vm_config_os_disk" {
  description = "Configuration for the OS disk of the virtual machines"
  type        = map(any)

}

variable "zones" {
  description = "Availabilty zone of the virtual machines"
  type        = list(string)
}

variable "subnet_id" {
  description = "	The name of the Location"

}

variable "tags" {
  
}


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
/*variable "azurerm_virtual_machine_rg_name" {
    description = "The name of Resource Group where Source VM resides"
    type        = string
}*/


variable "source_vm_id" {
  
}
