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
  offer = "rhel-byos"
  sku = "rhel-lvm92"
  version = "9.2.2023060509"
}
custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")

}