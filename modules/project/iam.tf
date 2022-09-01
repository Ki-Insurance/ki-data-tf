module "project-iam-bindings" {
  count      = var.project_bindings == {} ? 0 : 1
  source     = "terraform-google-modules/iam/google//modules/projects_iam"
  version    = "7.2.0"
  projects   = [var.project]
  mode       = "authoritative"
  bindings   = var.project_bindings
  depends_on = [google_service_account.service_accounts]
}

module "service_account-iam-bindings" {
  source           = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version          = "7.2.0"
  for_each         = { for iam in var.iam_service_account : iam.resource => iam }
  service_accounts = [each.value.resource]
  project          = var.project
  mode             = "authoritative"
  bindings         = each.value.bindings
  depends_on       = [google_service_account.service_accounts]
}
