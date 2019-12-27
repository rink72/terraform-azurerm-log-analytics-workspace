output "id" {
    description = "Log Analytics Resource ID"
    value = azurerm_log_analytics_workspace.la_workspace.id
}

output "workspace_id" {
    description = "Log Analytics Workspace Id"
    value = azurerm_log_analytics_workspace.la_workspace.workspace_id
}

output "primary_shared_key" {
    description = "Log Analytics Workspace Primary Key"
    value = azurerm_log_analytics_workspace.la_workspace.primary_shared_key
    sensitive = true
}

output "secondary_shared_key" {
    description = "Log Analytics Workspace Secondary Key"
    value = azurerm_log_analytics_workspace.la_workspace.secondary_shared_key
    sensitive = true
}