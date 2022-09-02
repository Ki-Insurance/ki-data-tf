resource "azurerm_storage_account" "storage" {
  name                     = var.azure_blob_storage.storage_account_name
  resource_group_name      = var.azure_blob_storage.resource_group_name
  location                 = var.azure_blob_storage.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Hot"
  tags                     = var.azure_blob_storage.tags
}

resource "azurerm_storage_encryption_scope" "encryption-scope" {
  name               = var.azure_blob_storage.encryption_scope_name
  storage_account_id = azurerm_storage_account.storage.id
  source             = "Microsoft.Storage"
}

resource "azurerm_storage_container" "storage-container" {
  name                 = var.azure_blob_storage.container_name
  storage_account_name = var.azure_blob_storage.storage_account_name
}
