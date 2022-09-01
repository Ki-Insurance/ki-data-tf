module "secret_manager_iam" {
  source     = "terraform-google-modules/iam/google//modules/secret_manager_iam"
  version    = "7.2.0"
  for_each   = { for iam in var.iam_secrets : iam.resource => iam }
  project    = var.project
  secrets    = [each.value.resource]
  mode       = "authoritative"
  bindings   = each.value.bindings
  depends_on = [module.secret]
}
