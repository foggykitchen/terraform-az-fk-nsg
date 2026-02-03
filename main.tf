resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "security_rule" {
    for_each = { for r in var.rules : r.name => r }
    content {
      name      = security_rule.value.name
      priority  = security_rule.value.priority
      direction = security_rule.value.direction
      access    = security_rule.value.access
      protocol  = security_rule.value.protocol

      # Ports (either singular or plural)
      source_port_range       = try(security_rule.value.source_port_range, null)
      source_port_ranges      = try(security_rule.value.source_port_ranges, null)
      destination_port_range  = try(security_rule.value.destination_port_range, null)
      destination_port_ranges = try(security_rule.value.destination_port_ranges, null)

      # Addresses (either singular or plural)
      source_address_prefix       = try(security_rule.value.source_address_prefix, null)
      source_address_prefixes     = try(security_rule.value.source_address_prefixes, null)
      destination_address_prefix  = try(security_rule.value.destination_address_prefix, null)
      destination_address_prefixes = try(security_rule.value.destination_address_prefixes, null)

      description = try(security_rule.value.description, null)

      source_application_security_group_ids      = try(security_rule.value.source_application_security_group_ids, null)
      destination_application_security_group_ids = try(security_rule.value.destination_application_security_group_ids, null)
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.subnet_associations

  subnet_id                 = each.value.subnet_id
  network_security_group_id = azurerm_network_security_group.this.id
}
