terraform {
  experiments = [module_variable_optional_attrs]
}

module "service_principals" {
  for_each          = { for sp in var.azure_service_principals : sp.name => sp }
  source            = "./service_principal"
  service_principal = each.value
}
