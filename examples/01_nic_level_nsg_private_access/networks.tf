module "vnet" {
  source = "github.com/mlinxfeld/terraform-az-fk-vnet"

  name                = var.vnet_name
  location            = azurerm_resource_group.foggykitchen_rg.location
  resource_group_name = azurerm_resource_group.foggykitchen_rg.name

  address_space = [var.vnet_address_space]
  
  subnets = {
    "fk-subnet-private" = {
      address_prefixes = [var.private_subnet_cidr]
    }

    # Required exact name for Bastion
    "AzureBastionSubnet" = {
      address_prefixes = [var.bastion_subnet_cidr]
    }
  }

  tags = var.tags
}
