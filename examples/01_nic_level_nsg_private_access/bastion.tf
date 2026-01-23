resource "azurerm_bastion_host" "this" {
  name                = "fk-bastion"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name
  sku                 = "Standard" 
  tunneling_enabled   = true
  ip_connect_enabled  = true

  ip_configuration {
    name                 = "bastion-ipcfg"
    subnet_id            = module.vnet.subnet_ids["AzureBastionSubnet"]
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }

  tags = var.tags
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "fk-bastion-pip"
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}
