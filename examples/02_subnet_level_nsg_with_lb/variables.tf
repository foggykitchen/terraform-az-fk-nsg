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
  description = "VNet name"
  type        = string
  default     = "fk-vnet"
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
  default     = "fk-backend-vm"
}

variable "admin_username" {
  description = "Linux admin username"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "vm_number" {
  description = "Azure VM number"
  type        = number
  default     = 2
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

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    project = "foggykitchen"
    module  = "terraform-az-fk-compute"
    example = "03_multiple_vms_with_lb"
    env     = "dev"
  }
}
