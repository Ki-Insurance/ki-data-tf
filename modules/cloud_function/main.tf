terraform {
  experiments = [module_variable_optional_attrs]
}

resource "google_cloudfunctions_function" "function" {
  for_each              = { for func in var.cloud_functions : func.name => func }
  project               = var.project
  name                  = each.value.name
  entry_point           = each.value.entry_point
  description           = each.value.description
  runtime               = each.value.runtime
  region                = var.region
  service_account_email = each.value.service_account_email
  available_memory_mb   = each.value.available_memory_mb
  timeout               = each.value.timeout
  source_archive_bucket = each.value.archive_bucket
  source_archive_object = each.value.archive_path
  trigger_http          = true
  ingress_settings      = "ALLOW_ALL" # Might want to change that in the future
  max_instances         = each.value.max_instances
  min_instances         = each.value.min_instances
  environment_variables = each.value.environment_variables
  dynamic "secret_environment_variables" {
    for_each = { for secret_envs in coalesce(each.value.secret_environment_variables, []) : secret_envs.key => secret_envs }
    content {
      key        = secret_environment_variables.value.key
      secret     = secret_environment_variables.value.secret
      version    = "latest"
    }
  }
}
