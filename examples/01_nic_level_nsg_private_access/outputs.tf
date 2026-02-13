output "bastion_name" {
  value       = module.bastion.bastion_name
  description = "Azure Bastion host name."
}

output "nsg_id" {
  value       = module.nsg.id
  description = "NSG ID attached to VM NIC."
}

output "ssh_private_key_pem" {
  description = "Private key for SSH (use it in Bastion SSH connection). Keep it secret."
  value       = tls_private_key.public_private_key_pair.private_key_pem
  sensitive   = true
}
