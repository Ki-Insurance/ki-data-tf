output "client_id" {
  value = azuread_application.main.application_id
}

output "client_secret" {
  value     = azuread_service_principal_password.main.value
  sensitive = true
}

output "object_id" {
  value = azuread_service_principal.main.object_id
}
