
output "vnet_id_out" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_name_out" {
  value = azurerm_virtual_network.vnet.name
}

output "azure_subnet_id_out" {
    value = {
        for id in keys(var.subnets) : id => azurerm_subnet.subnet[id].id
    }
    description = "Lists the ID's of the subnets"
}
output "azure_subnet_name_out" {
    value = {
        for name in keys(var.subnets) : name => azurerm_subnet.subnet[name].name
    }
    description = "Lists the name's of the subnets"
}


output "azure_subnet_address_out" {
    value = {
        for name in keys(var.subnets) : name => azurerm_subnet.subnet[name].address_prefixes
    }
    description = "Lists the subnets of the subnets"
}



