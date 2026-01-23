variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource group name for this example"
  type        = string
  default     = "fk-rg"
}

variable "vnet_name" {
  type    = string
  default = "fk-vnet"
}

variable "vm_name" {
  type    = string
  default = "fk-private-vm"
}

variable "vnet_address_space" {
  description = "VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR."
  type        = string
  default     = "10.10.1.0/24"
}

variable "bastion_subnet_cidr" {
  description = "AzureBastionSubnet CIDR (must be /26 or larger, e.g. /26)."
  type        = string
  default     = "10.10.100.0/26"
}


variable "admin_username" {
  description = "Linux admin username"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default = {
    project = "foggykitchen"
    module  = "terraform-az-fk-nsg"
    example = "01_nic_level_nsg_private_access"
  }
}
