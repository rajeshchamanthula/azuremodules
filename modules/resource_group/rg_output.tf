/*output "rg_out" {
  description = "To display all resource group names"
  value = [for rg_name in var.rg :"rg-${var.env}-${var.client}-${each.value}"]
}

 output "rg_out" {
  description = "To display all resource group names"
  value = [for rg_name in var.rg : "rg-${var.env}-${var.client}-${each.value}"]
}*/
 
# Output for the resource group names

output "rg_out" {
  description = "IDs of the created resource groups"
  value       = [for rg_name in toset(var.rg) : azurerm_resource_group.rg[rg_name].name]
}