variable "name" {
  description = "Name of the Network Security Group."
  type        = string
}

variable "location" {
  description = "Azure region where NSG will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where NSG will be created."
  type        = string
}

variable "tags" {
  description = "Tags to apply to NSG."
  type        = map(string)
  default     = {}
}

variable "rules" {
  description = <<DESC
List of NSG security rules.

Supports both singular and plural forms:
- source_address_prefix OR source_address_prefixes
- destination_address_prefix OR destination_address_prefixes
- source_port_range OR source_port_ranges
- destination_port_range OR destination_port_ranges

Notes:
- Azure requires a unique priority per NSG (100-4096).
- For protocol use: Tcp, Udp, Icmp, Esp, Ah, or *.
DESC

  type = list(object({
    name      = string
    priority  = number
    direction = string # "Inbound" or "Outbound"
    access    = string # "Allow" or "Deny"
    protocol  = string # "Tcp" | "Udp" | "*" etc.

    # Ports (choose either *_port_range or *_port_ranges)
    source_port_range      = optional(string)
    source_port_ranges     = optional(list(string))
    destination_port_range = optional(string)
    destination_port_ranges = optional(list(string))

    # Addresses (choose either *_address_prefix or *_address_prefixes)
    source_address_prefix      = optional(string)
    source_address_prefixes    = optional(list(string))
    destination_address_prefix = optional(string)
    destination_address_prefixes = optional(list(string))

    # Optional extras (handy, but still V1-friendly)
    description               = optional(string)
    source_application_security_group_ids      = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
  }))

  default = []
}

variable "subnet_associations" {
  description = "Optional map of subnet associations (NSG -> subnet). Keys must be stable names."
  type = map(object({
    subnet_id = string
  }))
  default = {}
}