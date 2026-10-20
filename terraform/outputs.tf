output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}