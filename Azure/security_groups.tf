#Management NSG
resource "azurerm_network_security_group" "cp-mgmt-nsg" {
  depends_on=[azurerm_resource_group.cp-mgmt-rg]
  name = "cp-mgmt-nsg"
  location            = azurerm_resource_group.cp-mgmt-rg.location
  resource_group_name = azurerm_resource_group.cp-mgmt-rg.name
  security_rule {
    name                       = "SSH"
    description                = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "GAiA-portal"
    description                = "GAiA-portal"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "SmartConsole-1"
    description                = "SmartConsole-1"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18190"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "SmartConsole-2"
    description                = "SmartConsole-2"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "19009"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "Logs"
    description                = "Logs"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "257"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "ICA-pull"
    description                = "ICA-pull"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18210"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "CRL-fetch"
    description                = "CRL-fetch"
    priority                   = 160
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18191"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.environment
  }
}




