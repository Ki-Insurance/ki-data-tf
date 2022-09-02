resource "google_secret_manager_secret_version" "sa-secret-version" {
  secret = var.secret_id
  secret_data = jsonencode({
    "AZURE_CLIENT_ID"     = var.azure_service_principal_credentials[var.service_principal]["client_id"]
    "AZURE_CLIENT_SECRET" = var.azure_service_principal_credentials[var.service_principal]["client_secret"]
  })
}
