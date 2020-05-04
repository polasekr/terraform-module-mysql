variable "resource_group_name" {
  description = "Default resource group name that the database will be created in."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "db_name" {
  description = "The name of the database to be created."
}

variable "admin_username" {
  description = "The administrator username of MySQL Server."
}

variable "password" {
  description = "The administrator password of the MySQL Server."
}

variable "db_version" {
  description = "Specifies the version of MySQL to use. Valid values are 5.6 and 5.7."
  default     = "5.7"
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enforced and Disabled."
  default     = "Enabled"
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 5120
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
}

variable "charset" {
  description = "Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset."
  default     = "utf8"
}

variable "collation" {
  description = "Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation."
  default     = "utf8_unicode_ci"
}

variable "auto_grow" {
  description = "Defines whether autogrow is enabled or disabled for the storage"
  default     = "Disabled"
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MySQL Server"
}

variable "tags" {
  default     = {}
  description = "Any tags that should be present on the Virtual Network resources"
  type        = map(string)
}

#variable "allowed_cidrs" {
#  type        = list(string)
#  description = "List of authorized cidrs"
#}

variable "mysql_options" {
  type        = list(map(string))
  default     = []
  description = "List of configuration options : https://docs.microsoft.com/fr-fr/azure/mysql/howto-server-parameters#list-of-configurable-server-parameters"
}

variable "ARM_SUBSCRIPTION_ID" { }
variable "ARM_CLIENT_ID" { }
variable "ARM_CLIENT_SECRET" { }
variable "ARM_TENANT_ID" { }
