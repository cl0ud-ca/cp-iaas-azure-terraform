#CP Management Public IP
resource "azurerm_public_ip" "cp-mgmt-public-ip" {
    name                         = "cp-mgmt-public-ip"
    location                     = azurerm_resource_group.cp-mgmt-rg.location
    resource_group_name          = azurerm_resource_group.cp-mgmt-rg.name
    allocation_method = "Static"
}

# Output the public ip of the gateway
output "CP_Gateway_Public_IP" {
    value = azurerm_public_ip.cp-mgmt-public-ip.ip_address
}