resource "google_iap_brand" "iap_brand" {
  provider          = google
  project           = var.project
  support_email     = var.support_email
  application_title = var.application_title
}

resource "google_iap_client" "iap_monitoring_client" {
  provider     = google
  display_name = var.application_title
  brand        = google_iap_brand.iap_brand.name
}
