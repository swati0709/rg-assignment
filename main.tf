# Resource groups per region
resource "azurerm_resource_group" "rg_kv" {
  name     = "${var.project_prefix}-rg-kv-ce"
  location = var.location_kv
  tags     = { env = var.env }
}

resource "azurerm_resource_group" "rg_sa_lrs" {
  name     = "${var.project_prefix}-rg-sa-cc"
  location = var.location_sa_lrs
  tags     = { env = var.env }
}

resource "azurerm_resource_group" "rg_sa_ragrs" {
  name     = "${var.project_prefix}-rg-sa-ce"
  location = var.location_sa_ragrs
  tags     = { env = var.env }
}

# Key Vault in Canada East, public access disabled, soft delete 7 days
module "kv" {
  source              = "./modules/keyvault"
  name                = "${var.project_prefix}kvce"
  location            = azurerm_resource_group.rg_kv.location
  resource_group_name = azurerm_resource_group.rg_kv.name

  public_network_access_enabled = false
  soft_delete_retention_days    = 7

  env = var.env
}

# Storage Account LRS in Canada Central, public access disabled
module "sa_lrs_cc" {
  source              = "./modules/storage_account"
  name                = "${var.project_prefix}salrscc"
  location            = azurerm_resource_group.rg_sa_lrs.location
  resource_group_name = azurerm_resource_group.rg_sa_lrs.name

  account_replication_type      = "LRS"
  public_network_access_enabled = false

  env = var.env
}

# Storage Account RA-GRS in Canada East, public access enabled
module "sa_ragrs_ce" {
  source              = "./modules/storage_account"
  name                = "${var.project_prefix}saragrsce"
  location            = azurerm_resource_group.rg_sa_ragrs.location
  resource_group_name = azurerm_resource_group.rg_sa_ragrs.name

  account_replication_type      = "RAGRS"
  public_network_access_enabled = true

  env = var.env
}