# Create Resource Group

resource "azurerm_resource_group" "rg" {
   name     = "rg-${var.env}-${var.client}-${each.value}"
   location = var.location
   for_each = toset(var.rg)
   tags = var.tags
         lifecycle {
     
     prevent_destroy = true
   }
}
