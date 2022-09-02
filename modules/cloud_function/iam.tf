resource "google_cloudfunctions_function_iam_binding" "cloud_function_iam" {
  for_each = merge([for iam in var.iam : {
    for k, v in iam.bindings : "${iam.resource}-${k}" => {
      "resource" = iam.resource,
      "role"     = k,
      "members"  = v
    }
  }]...)
  project        = var.project
  cloud_function = each.value.resource
  role           = each.value.role
  members        = each.value.members
  region         = var.region
  depends_on = [
    google_cloudfunctions_function.function
  ]
}
