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
