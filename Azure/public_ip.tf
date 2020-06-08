#CP Management Public IP
resource "azurerm_public_ip" "cp-mgmt-public-ip" {
    name                         = "cp-mgmt-public-ip"
    location                     = azurerm_resource_group.cp-mgmt-rg.location
    resource_group_name          = azurerm_resource_group.cp-mgmt-rg.name
    allocation_method = "Static"
}

#CP Gateway Public IP
resource "azurerm_public_ip" "cp-gw-public-ip" {
    name                         = "cp-gw-public-ip"
    location                     = azurerm_resource_group.cp-gw-rg.location
    resource_group_name          = azurerm_resource_group.cp-gw-rg.name
    allocation_method = "Static"
}

# Output the public ip of the gateway
output "CP_Management_Public_IP" {
    value = azurerm_public_ip.cp-mgmt-public-ip.ip_address
}

# Output the public ip of the gateway
output "CP_Gateway_Public_IP" {
    value = azurerm_public_ip.cp-gw-public-ip.ip_address
}