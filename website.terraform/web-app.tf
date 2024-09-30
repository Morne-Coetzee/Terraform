resource "azurerm_service_plan" "asp" {
  name                = "${var.prefix}asp${var.postfix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "${var.asp_sku}"
  os_type             = "${var.asp_os_type}"
}

resource "azurerm_windows_web_app" "webapp" {
  name                      = "${var.prefix}webapp${var.postfix}"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  service_plan_id           = azurerm_service_plan.asp.id
  virtual_network_subnet_id = "${var.asp_vnet_subnet_id}"

  app_settings = {
    ASPNETCORE_ENVIRONMENT = "${var.asp_environment_name}"
    CORECLR_ENABLE_PROFILING = 1
    CORECLR_NEWRELIC_HOME = "C:\\Home\\site\\wwwroot\\newrelic"
    CORECLR_PROFILER = "{36032161-FFC0-4B61-B559-F6C5D41BAE5A}"
    CORECLR_PROFILER_PATH_32 = "C:\\Home\\site\\wwwroot\\newrelic\\x86\\NewRelic.Profiler.dll"
    CORECLR_PROFILER_PATH_64 = "C:\\Home\\site\\wwwroot\\newrelic\\NewRelic.Profiler.dll"
    NEWRELIC_LOG_DIRECTORY = "C:\\Home\\LogFiles\\NewRelic"
    NEW_RELIC_APP_NAME = var.asp_new_relic_app_name
    NEW_RELIC_LICENSE_KEY = var.asp_new_relic_license_key
    WEBSITE_ENABLE_SYNC_UPDATE_SITE = true
  }

  site_config {
    always_on = false
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v8.0"
    }
    virtual_application {
      # default values, if not set then terraform always updates these to null on deployment
      physical_path = "site\\wwwroot"
      preload       = false
      virtual_path  = "/"
    }
    vnet_route_all_enabled = var.asp_vnet_route_all_enabled
  }
  https_only = true
}

resource "azurerm_app_service_custom_hostname_binding" "hostname_binding" {
  count               = var.link_customdomain ? 1 : 0
  hostname            = var.customdomain_name
  ssl_state           = var.customdomain_ssl_state
  thumbprint          = var.customdomain_thumbprint
  app_service_name    = azurerm_windows_web_app.webapp.name
  resource_group_name = azurerm_resource_group.rg.name
}
