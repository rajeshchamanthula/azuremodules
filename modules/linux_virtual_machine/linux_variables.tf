
variable "rg" {
  description = "Name of the existing Compute Resource Group"
  type        = string
}
variable "vm_count" {
  description = "Number of VMs to create"
  type        = number

}

variable "vm_username" {
  description = "Username for the VMs"
  type        = string

}


variable "vm_name"{
  description = "name of the vm"
 type    = list(string)
  default = []
}

variable "vm_size"{
  description = "The size of the virtual machines"
   type    = string

}

variable "private_ip_address"{
  description = "The base private IP address for the virtual machines. Each VM will be suffixed with a number."
   type    = string

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
  type = map

}

variable "zones"{
  description = "Availabilty zone of the virtual machines"
   type    = list(string)
}

variable "location" {
  description = "	The name of the Location"
  type = string
}
variable "subnet_id" {
  description = "	The name of the Location"
  
}
variable "tags" {
  
}