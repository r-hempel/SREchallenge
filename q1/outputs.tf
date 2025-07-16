output "storage_account_id" {
    value = azurerm_storage_account.srechallengeforfp.id
    }

output "storage_account_primary_access_key" {
    value = azurerm_storage_account.srechallengeforfp.primary_access_key
    sensitive = true
    # As I do not know anything about the underlying infrastructure, this would be a 
    # point to discuss further. So far, this is very sensitive data that is printed.
}

output "storage_account_primary_connection_string" {
    value = azurerm_storage_account.srechallengeforfp.primary_connection_string
}

output "cointainer_id" {
    value = azurerm_storage_container.sre.id
}