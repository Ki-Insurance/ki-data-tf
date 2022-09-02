terraform {
  experiments = [module_variable_optional_attrs]
}

resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret.name
  replication {
    user_managed {
      replicas {
        location = var.region
      }
      replicas {
        location = var.replica_region
      }
    }
  }
  project = var.project
}

resource "google_secret_manager_secret_version" "iap-secret-credential" {
  count       = var.secret.value_from_iap_credential == null ? 0 : 1
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret.value_from_iap_credential
}

module "service_principal_secret_value" {
  count                               = var.secret.value_from_service_principal == null ? 0 : 1
  source                              = "./value_from_service_principal"
  azure_service_principal_credentials = var.azure_service_principal_credentials
  secret_id                           = google_secret_manager_secret.secret.id
  service_principal                   = var.secret.value_from_service_principal
}
