resource "azurerm_app_service_plan" "example" {
  name                = "svcplan${var.app}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "svc${var.app}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id


   site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|requarks/wiki:2"
  }


  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    #"DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
    "DB_TYPE" = "postgres"
    "DB_HOST" = "pgsql${var.app}.postgres.database.azure.com"
    "DB_PORT" = 5432
    "DB_USER" = "${var.postgresql-admin-login}@pgsql${var.app}"
    "DB_PASS" =  var.postgresql-admin-password
    "DB_NAME" = "postgres"
    "DB_SSL" = "true"
    "WEBSITE_AUTH_DISABLE_IDENTITY_FLOW" = "true"
    "NODE_OPTIONS" = "--max-http-header-size=81920"
  }

depends_on = [azurerm_postgresql_server.example]

}




   