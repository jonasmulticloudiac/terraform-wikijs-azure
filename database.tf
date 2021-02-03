resource "azurerm_virtual_network" "example" {
  name                = "vnet${var.app}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet${var.app}"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Sql"]

}

resource "azurerm_postgresql_server" "example" {
  name                = "pgsql${var.app}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku_name = var.postgresql-sku-name

  storage_mb                   = var.postgresql-storage
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.postgresql-admin-login
  administrator_login_password = var.postgresql-admin-password
  version                      = var.postgresql-version 
  ssl_enforcement_enabled      = true
}



resource "azurerm_postgresql_firewall_rule" "example" {
  name                = "firewall${var.app}"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

