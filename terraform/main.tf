locals {
  resource_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${local.resource_prefix}"
  location = var.location
  tags     = local.common_tags
}

module "security" {
  source = "./modules/security"

  nsg_name            = "nsg-${local.resource_prefix}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.common_tags
}

module "network" {
  source = "./modules/network"

  vnet_name               = "vnet-${local.resource_prefix}"
  location                = azurerm_resource_group.main.location
  resource_group_name     = azurerm_resource_group.main.name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = "snet-${local.resource_prefix}-app"
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = local.common_tags
  nsg_id                  = module.security.nsg_id
}