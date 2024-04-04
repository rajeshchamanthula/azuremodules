output "vm_id_out" {
  description = "List out the Virtual machine Names"
  value       = [for vm_id in var.vm_name : azurerm_virtual_machine.vm[*].id]
}

output "vm0_id_out" {
  description = "List out the Virtual machine Names"
  value       = [for vm_id in var.vm_name : azurerm_virtual_machine.vm[0].id]
}

output "vm1_id_out" {
  description = "List out the Virtual machine Names"
  value       = [for vm_id in var.vm_name : azurerm_virtual_machine.vm[1].id]
}



#module.linux_virtual_machine.azurerm_virtual_machine.vm[0]

/*output "rg_out" {
  description = "IDs of the created resource groups"
  value       = [for rg_name in toset(var.rg) : azurerm_resource_group.rg[rg_name].name]
}*/