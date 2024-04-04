
# # * * * * * * *  module resource_groups is used to build Resource Groups [Primary and Secondary] * * * * * * *
module "resource_groups" {
  source   = "../modules/resource_group"
  location = var.location
  env      = var.env
  client   = var.client
  rg       = var.rg
  tags = var.tags
}


# # * * * * * * *  module virtual_networks is used for creating vnets in each Resource Group * * * * * * *
module "virtual_networks" {
  source        = "../modules/virtual_networks"
  location      = var.location
  client        = var.client
  env           = var.env
  rg            = module.resource_groups.rg_out[1]
  address_space = var.address_space
  subnets       = var.subnets
  tags = var.tags 

}

module "storage_accounts" {
  source         = "../modules/storage_account"
  location       = var.location
  rg             = module.resource_groups.rg_out[2]
  storageaccount = var.storageaccount
  tags = var.tags
}



module "linux_virtual_machine" {
  source                  = "../modules/linux_virtual_machine"
  rg                      = module.resource_groups.rg_out[0]
  location                = var.location
  subnet_id               = module.virtual_networks.azure_subnet_id_out[var.subnet_id]
  zones                   = var.zones
  vm_count                = var.vm_count
  vm_name                 = var.vm_name
  vm_username             = var.vm_username
  vm_size                 = var.vm_size
  private_ip_address      = var.private_ip_address
  storage_image_reference = var.storage_image_reference
  azure_vm_config_os_disk = var.azure_vm_config_os_disk
  tags = var.tags

}

module "recovery_service_vault" {
  source                  = "../modules/recovery_service_vault"
  rg                      = module.resource_groups.rg_out[2]
  location                = var.location
  azurerm_recovery_services_vault_rsv_name = var.azurerm_recovery_services_vault_rsv_name
  azurerm_recovery_services_vault_sku = var.azurerm_recovery_services_vault_sku
  azurerm_recovery_services_vault_storage_mode = var.azurerm_recovery_services_vault_storage_mode
  azurerm_recovery_services_vault_soft_delete = var.azurerm_recovery_services_vault_soft_delete
  azurerm_backup_policy_vm_name = var.azurerm_backup_policy_vm_name
  azurerm_backup_policy_vm_timezone = var.azurerm_backup_policy_vm_timezone
  vm_rg =  module.resource_groups.rg_out[2]
  source_vm_id = var.source_vm_id
  tags = var.tags
}