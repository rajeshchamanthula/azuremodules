# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.env}-${var.client}"
  location            = var.location
  resource_group_name = var.rg
  address_space = var.address_space
  tags= var.tags
  
  
}

# Create a Subnet

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name = var.rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  name = "${each.value["name"]}-${var.env}-snet"

  address_prefixes     = each.value["address_prefixes"]
  

  lifecycle {
    prevent_destroy = true
  }
}

# Create a Network Security group


resource "azurerm_network_security_group" "nsg" {
  for_each = var.subnets
  name               = "${each.value["name"]}-${var.env}-nsg"
  location            = var.location
  resource_group_name = var.rg

  lifecycle {
    prevent_destroy = true
  }
}


