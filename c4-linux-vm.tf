resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  count = 2
  name = "mylinuxvm-${count.index}"
  computer_name = "devlinux-${count.index}"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  size = "Standard_D2s_v4"
  admin_username = "azureuser"
  network_interface_ids = [ element(azurerm_network_interface.myvmnic[*].id, count.index) ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
os_disk {
  name = "osdisk-${count.index}"
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
}


source_image_reference {
  publisher = "RedHat"
  offer = "RHEL"
  sku = "92-gen2"
  version = "latest"
}
/*
plan {
  name = "rhel-lvm92"
  publisher = "RedHat"
  product = "rhel-byos"
}
*/
custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")

}