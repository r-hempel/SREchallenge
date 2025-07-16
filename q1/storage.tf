resource "azurerm_storage_account" "srechallengeforfp" {
  name                     = var.storageAccountName
  resource_group_name      = var.storageAccountResourceGroup
  location                 = var.location 
  account_replication_type = split("_", var.storageAccountSKU)[1]
  access_tier              = var.storageAccountAccessTier
  account_tier             = split("_", var.storageAccountSKU)[0]

  tags = {
    department = var.storageAccountTag
  }
}

resource "azurerm_storage_container" "sre" {
  name                  = var.storageAccountCointainerName
  storage_account_name  = azurerm_storage_account.srechallengeforfp.name
  container_access_type = var.storageAccountCointainerType
}