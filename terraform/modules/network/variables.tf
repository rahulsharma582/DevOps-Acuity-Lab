variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Existing resource group name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual network address space"
}

variable "subnet_name" {
  type        = string
  description = "Application subnet name"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Application subnet prefixes"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}
variable "nsg_id" {
  description = "Network Security Group ID"
  type        = string
}
