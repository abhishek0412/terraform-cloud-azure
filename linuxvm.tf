resource "azurerm_linux_virtual_machine" "linuxvmterraform" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.rgterraform.name
  location            = azurerm_resource_group.rgterraform.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  
  network_interface_ids = [
    azurerm_network_interface.nicterraform.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  #custom_data = filebase64("${path.module}/app-scripts/web-vm.sh")

  provisioner "file" {
    source = ""
    destination = ""
    on_failure = fail
  }

  provisioner "local-exec" {
    command = ""
    when = create
    on_failure = continue
  }

  provisioner "remote-exec" {
    inline = [ "" ]
    when = destroy
    on_failure = continue
  }
  tags = var.myTag
}

