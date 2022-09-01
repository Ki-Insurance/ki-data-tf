output "client_credentials" {
  value = {
    "${var.application_title}" = jsonencode({
      client_id     = google_iap_client.iap_monitoring_client.client_id
      client_secret = google_iap_client.iap_monitoring_client.secret
    })
  }
  sensitive = true
}