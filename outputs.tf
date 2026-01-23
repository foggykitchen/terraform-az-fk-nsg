output "id" {
  description = "ID of the created Network Security Group."
  value       = azurerm_network_security_group.this.id
}

output "name" {
  description = "Name of the created Network Security Group."
  value       = azurerm_network_security_group.this.name
}

output "resource_group_name" {
  description = "Resource group name where NSG was created."
  value       = azurerm_network_security_group.this.resource_group_name
}

output "subnet_association_ids" {
  description = "IDs of subnet-NSG association resources (if any)."
  value       = [for k, v in azurerm_subnet_network_security_group_association.this : v.id]
}

