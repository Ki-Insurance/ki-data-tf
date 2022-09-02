variable "azure_blob_storage" {
  type = object({
    storage_account_name  = string
    resource_group_name   = string
    encryption_scope_name = string
    location              = string
    tags                  = map(string)
    container_name        = string
  })
}
