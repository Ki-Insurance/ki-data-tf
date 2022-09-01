terraform {
  experiments = [module_variable_optional_attrs]
}

resource "google_service_account" "service_accounts" {
  for_each   = toset(var.service_accounts)
  project    = var.project
  account_id = each.value
}

resource "google_app_engine_application" "app_engine" {
  project       = var.project
  location_id   = var.region
  database_type = "CLOUD_FIRESTORE"
}
