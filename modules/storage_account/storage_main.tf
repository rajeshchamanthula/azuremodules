# Storage account for VM's Boot Diag

resource "random_id" "storage_account_id" {
  byte_length = 4
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "${var.storageaccount}${random_id.storage_account_id.hex}"
  resource_group_name = var.rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = false
   tags = var.tags
    
    
     
   lifecycle {
    prevent_destroy = true
  }

}


