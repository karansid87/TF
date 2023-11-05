# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  for_each = var.environment
  name                = "mylinuxvm-${each.key}"
  computer_name       = "${each.key}" # Hostname of the VM
  resource_group_name = data.azurerm_resource_group.RG.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmnic[each.key].id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    #disk_size_gb = 20
  }
  source_image_reference {
  publisher = "RedHat"
  offer = "RHEL"
  sku = "92-gen2"
  version = "latest"
}
  #custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}


data "azurerm_resource_group" "RG" {
  name = "${var.RG}"
}