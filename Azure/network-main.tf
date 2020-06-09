# Create CP Management network VNET
resource "azurerm_virtual_network" "cp-mgmt-network-vnet" {
  name                = "${var.company}-cp-mgmt-vnet"
  address_space       = [var.mgmt-network-vnet-cidr]
  resource_group_name = azurerm_resource_group.cp-mgmt-rg.name
  location            = azurerm_resource_group.cp-mgmt-rg.location
  tags = {
    application = var.company
    environment = var.environment
  }
}

# Create CP Management subnet for Network
resource "azurerm_subnet" "cp-mgmt-subnet" {
  name                 = "${var.company}-cp-mgmt-subnet"
  address_prefix       = var.mgmt-network-subnet-cidr
  virtual_network_name = azurerm_virtual_network.cp-mgmt-network-vnet.name
  resource_group_name  = azurerm_resource_group.cp-mgmt-rg.name
}

