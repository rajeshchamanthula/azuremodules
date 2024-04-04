## Create Recovery Service Vault

resource "azurerm_recovery_services_vault" "rsv" {
  name                = var.azurerm_recovery_services_vault_rsv_name
  location            = var.location
  resource_group_name = var.rg
  sku                 = var.azurerm_recovery_services_vault_sku
  storage_mode_type   = var.azurerm_recovery_services_vault_storage_mode
  soft_delete_enabled = var.azurerm_recovery_services_vault_soft_delete
}

## Create a Policy

resource "azurerm_backup_policy_vm" "rsv" {
  name                = var.azurerm_backup_policy_vm_name
  resource_group_name = var.rg
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name

  timezone = var.azurerm_backup_policy_vm_timezone

  backup {
    frequency = "Daily"
    time      = "21:00"
  }

  retention_daily {
    count = 14
  }

  retention_weekly {
    count    = 2
    weekdays = ["Sunday"]
  }

  retention_monthly {
    count    = 1
    weekdays = ["Sunday"]
    weeks    = ["Last"]
  }

  retention_yearly {
    count    = 1
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}


## Configure policy for the server1

resource "azurerm_backup_protected_vm" "vm1" {
  for_each = toset(var.source_vm_id)
  resource_group_name = var.vm_rg
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  source_vm_id        = each.value
  backup_policy_id    = azurerm_backup_policy_vm.rsv.id
}
