resource "google_iap_web_iam_binding" "iam" {
  for_each = { for role, members in try(var.bindings, {}) : role => members }
  project  = var.project
  role     = each.key
  members  = each.value
}
