output "database_name" {
    value = azurerm_mssql_database.kpwebsite_sql.name # Confirm about database name
}

output "webapp_name" {
  value = azurerm_windows_web_app.webapp.name
}

output "hostname" {
  value = var.link_customdomain ? azurerm_app_service_custom_hostname_binding.hostname_binding[0].hostname : azurerm_windows_web_app.webapp.default_hostname
}
