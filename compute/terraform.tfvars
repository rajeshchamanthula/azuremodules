location = "eastus2"

# The location/region code to keep all your resources.
env = "stag"

# Productive environment type. Possible values: pro, pre, dev, int, qa, dr.
client = "client-sathiya"

# This is connectivity type of the region expected values are hub,spoke(sp1,sp2,etc..).
rg = ["network", "app", "storage"]

# This is the Vnet address space to be created
address_space = ["10.150.150.0/24"]

# The address prefix list to use for the subnet.
subnets = {
  subnet_1 = {
    name             = "client"
    address_prefixes = ["10.150.150.0/24"]
  }
}

# Storage account name

storageaccount = "sathiyabootdisg"

tags = {
    Std_Owner       = "BLR-Team"
    Std_Environment = "Prod"
    Std_Project     = "client"
    Std_Billable    = "SRE"
  }

# Create VM
vm_count           = 2
vm_name            = ["stagvmclientapp1","stagvmclientweb1"]
vm_username        = "azureadmin"
vm_size            = "Standard_B2s"
zones              = ["1"]
subnet_id          = "subnet_1"
private_ip_address = "10.150.150."

storage_image_reference = {
  publisher = "RedHat"
  offer     = "RHEL"
  sku       = "8-lvm-gen2"
  version   = "latest"
}
azure_vm_config_os_disk = {
  storage_os_disk = {
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    disk_size_gb      = 64
  }
}

## Recovery Service Vault Name
azurerm_recovery_services_vault_rsv_name = "stag-azure-rsv"

## Recovery Service Vault SKU
azurerm_recovery_services_vault_sku = "Standard"

## The storage type of the Recovery Services Vault
azurerm_recovery_services_vault_storage_mode = "GeoRedundant"
azurerm_recovery_services_vault_soft_delete = "false"

## Policy Name
azurerm_backup_policy_vm_name = "rsv-vault-neu-stag-policy-prod"

##Time zone 
azurerm_backup_policy_vm_timezone = "UTC"

## Source Virtual Machine Resource Group
#azurerm_virtual_machine_rg_name = "rg-stag-client-sathiya-app"

## Virtual Machine name for configure the backup
#azurerm_virtual_machine_name1 = "moorthyvmlinux1"
#azurerm_virtual_machine_name1 = "stagvmclientapp1"

source_vm_id = {
  key1 = module.linux_virtual_machine.vm1_id_out
  #key2 = module.linux_virtual_machine.vm0_id_out
}