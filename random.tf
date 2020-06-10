
resource "random_id" "randomId2" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${azurerm_resource_group.cp-gw-rg.name}"
    }

    byte_length = 8
}