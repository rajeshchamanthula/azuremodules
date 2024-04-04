output "st_out" {
  value = "${var.storageaccount}${random_id.storage_account_id.hex}"
}

