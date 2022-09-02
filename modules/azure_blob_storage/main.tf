provider "azurerm" {
  features {}
}

module "blobs" {
  for_each           = { for blob in var.azure_blob_storages : blob.storage_account_name => blob }
  source             = "./blob"
  azure_blob_storage = each.value
}
