resource "azurerm_storage_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  account_tier             = "Standard"
  account_replication_type = var.account_replication_type

  public_network_access_enabled = var.public_network_access_enabled
  
  tags = { env = var.env }
}