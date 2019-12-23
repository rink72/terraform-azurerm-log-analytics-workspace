terraform {
  required_version = ">= 0.12.0"
}

provider "azurerm" {
  version = ">= 1.39.0"
}

resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "la_solution" {
  count                 = length(var.solutions)
  solution_name         = var.solutions[count.index].solution_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.la_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.la_workspace.name

  plan {
    publisher = var.solutions[count.index].publisher
    product   = var.solutions[count.index].product
  }
}