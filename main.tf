terraform {
  required_version = ">= 0.12.0"
}

# A special variable used to pass in dependencies to the module
variable "la_depends_on" {
    type = any
    description = "A special variable used to pass in dependencies to the module"
    default = null
}

resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days

  tags = var.tags

  # Check if there are any dependencies required
  depends_on = [
      var.la_depends_on
  ]
}

resource "azurerm_log_analytics_solution" "la_solution" {
  count                 = length(var.solutions)
  solution_name         = var.solutions[count.index].name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.la_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.la_workspace.name

  plan {
    publisher = var.solutions[count.index].publisher
    product   = var.solutions[count.index].product
  }
}
