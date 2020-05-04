resource "azurerm_mysql_server" "mysql" {
  name                = "${var.db_name}-mysqlsvr"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
    auto_grow             = var.auto_grow
  }

  administrator_login          = var.admin_username
  administrator_login_password = var.password
  version                      = var.db_version
  ssl_enforcement              = var.ssl_enforcement

  tags = var.tags
}

resource "azurerm_mysql_database" "mysql" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = var.charset
  collation           = var.collation
}

resource "azurerm_mysql_configuration" "mysql_config" {
  count = length(var.mysql_options)

  name                = var.mysql_options[count.index].name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  value               = var.mysql_options[count.index].value
}

#resource "azurerm_mysql_firewall_rule" "mysql" {
#  count = length(var.allowed_cidrs)
#
#  name                = replace(replace(var.allowed_cidrs[count.index], ".", "-"), "/", "_")
#  resource_group_name = var.resource_group_name
#  server_name         = azurerm_mysql_server.mysql.name
#  start_ip_address    = cidrhost(var.allowed_cidrs[count.index], 0)
#  end_ip_address      = cidrhost(var.allowed_cidrs[count.index], -1)
#}
