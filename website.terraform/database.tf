resource "azurerm_mssql_database" "kpwebsite_sql" {
  server_id = data.azurerm_mssql_server.refdata_sql_server.id
  name = "${var.prefix}sql${var.postfix}"
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name = "${var.database_sku}"
  max_size_gb = "${var.database_max_size_gb}"
  zone_redundant = false
  storage_account_type = "Local"
  transparent_data_encryption_enabled = true

  tags = {
    Environment = "Terraformed" # Comfirm about Enviroment
    Owner = "Morne Coetzee"
    Tier = "${var.resource_tier_tag}"
    ResourceType = "King Price Website 1.5 Database"
  }
}
