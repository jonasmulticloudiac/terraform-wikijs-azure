provider "azurerm" {
  version = "=2.13.0"

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "tcdb${var.app}"
  location = "eastus"
}
