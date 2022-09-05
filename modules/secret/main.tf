terraform {
  experiments = [module_variable_optional_attrs]
}

module "secret" {
  for_each       = { for secret in var.secrets : secret.name => secret }
  source         = "./secret"
  project        = var.project
  region         = var.region
  replica_region = var.replica_region
  secret = {
    "name"                         = each.value.name,
    "value_from_iap_credential"    = try(var.iap_client_credentials[each.value.value_from_iap_credential], null),
    "value_from_service_principal" = try(each.value.value_from_service_principal, null)
  }
  azure_service_principal_credentials = var.azure_service_principal_credentials
}
