
resource "random_password" "admin_password" {
  length      = 12
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true

  # Do not recreate password if it already exists
  lifecycle {
    ignore_changes = all
  }  
}


# Virtual machine creation

resource "azurerm_virtual_machine" "vm" {
  #count                 = var.vm_count
  #name                  = "${var.vm_name}${count.index + 1}"
  count                 = length(var.vm_name)
  name                  = "${var.vm_name[count.index]}"
  location              = var.location
  resource_group_name   = var.rg
  network_interface_ids = [azurerm_network_interface.vm[count.index].id]
  zones                  = var.zones
  vm_size               = var.vm_size
  tags = var.tags
  
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      # List the attributes to be ignored during apply
     vm_size,storage_data_disk,zones
    ]
  }

 storage_image_reference {

    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }

  storage_os_disk {
    #name              = "${var.vm_name}${count.index + 1}_OsDisk_1"
    name              = "${var.vm_name[count.index]}.Osdisk_1"
    caching           = var.azure_vm_config_os_disk.storage_os_disk.caching
    create_option     = var.azure_vm_config_os_disk.storage_os_disk.create_option
    managed_disk_type = var.azure_vm_config_os_disk.storage_os_disk.managed_disk_type
    disk_size_gb      = var.azure_vm_config_os_disk.storage_os_disk.disk_size_gb
    
  }
  
  os_profile {
    #computer_name  = "${var.vm_name}${count.index + 1}"
    computer_name  = "${var.vm_name[count.index]}"
    admin_username = var.vm_username
    admin_password = random_password.admin_password.result
  }
   os_profile_linux_config {
    disable_password_authentication = false
  }
  
}
# Create Network Interface

resource "azurerm_network_interface" "vm" {
  count               = length(var.vm_name)
  name                = "${var.vm_name[count.index]}.nic1"
  #count               = var.vm_count
  #name                = "${var.vm_name}${count.index + 1}.nic1"
  #enable_accelerated_networking = true
  location            = var.location
  resource_group_name = var.rg
  
  ip_configuration {
    #name                          = "${var.vm_name}${count.index + 1}.ipconfig1"
    name                          = "${var.vm_name[count.index]}.ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "${var.private_ip_address}${count.index + 4}" 
  }
    lifecycle {
    prevent_destroy = true
  }
}



