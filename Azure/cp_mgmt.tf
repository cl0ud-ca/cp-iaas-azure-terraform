# Create virtual machine and Accept the agreement for the mgmt-byol for R80.40
#resource "azurerm_marketplace_agreement" "checkpoint" {
#  publisher = "checkpoint"
#  offer     = "check-point-cg-r8040"
#  plan      = "mgmt-byol"
#}

#CP MGMT NIC
resource "azurerm_network_interface" "cp-mgmt-external" {
    name                = "cp-mgmt-external"
    location            = azurerm_resource_group.cp-mgmt-rg.location
    resource_group_name = azurerm_resource_group.cp-mgmt-rg.name
    enable_ip_forwarding = "true"
	ip_configuration {
        name                          = "cp-mgmt-public-ip-config"
        subnet_id                     = azurerm_subnet.cp-mgmt-subnet.id
        private_ip_address_allocation = "Static"
		private_ip_address = "10.1.0.10"
        primary = true
		public_ip_address_id = azurerm_public_ip.cp-mgmt-public-ip.id
    }
}

#Associate Security Group with Internface

resource "azurerm_network_interface_security_group_association" "cpmgmt-nsg-int" {
  network_interface_id      = azurerm_network_interface.cp-mgmt-external.id
  network_security_group_id = azurerm_network_security_group.cp-mgmt-nsg.id
  }


#CP MGMT Virtual Machine
resource "azurerm_virtual_machine" "cp-mgmt" {
    name                  = "${var.company}-cp-mgmt"
    location              = azurerm_resource_group.cp-mgmt-rg.location
    resource_group_name   = azurerm_resource_group.cp-mgmt-rg.name
    network_interface_ids = [azurerm_network_interface.cp-mgmt-external.id]
    primary_network_interface_id = azurerm_network_interface.cp-mgmt-external.id
    vm_size               = "Standard_D4s_v3"
    
 #   depends_on = [azurerm_marketplace_agreement.checkpoint]

    storage_os_disk {
        name              = "cp-mgmt-disk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "checkpoint"
        offer     = "check-point-cg-r8040"
        sku       = "mgmt-byol"
        version   = "latest"
    }

    plan {
        name = "mgmt-byol"
        publisher = "checkpoint"
        product = "check-point-cg-r8040"
        }
    os_profile {
        computer_name  = "${var.company}-cp-mgmt"
        admin_username = "azureuser"
        admin_password = "Vpn123vpn123!"
        custom_data = file("mgmt_bootstrap.sh") 
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = azurerm_storage_account.cp-mgmt-storage-account.primary_blob_endpoint
    }

}
