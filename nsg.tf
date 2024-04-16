resource "azurerm_network_security_group" "nsg-terraform" {

  name                = "nsg-terraform"
  location            = azurerm_resource_group.rgterraform.location
  resource_group_name = azurerm_resource_group.rgterraform.name
  tags                = var.myTag

}