# ki-data-tf

Repo containing common terraform modules to reuse with terragrunt

## How to use

In your terragrunt.hcl module files, add the reference to a module and pass the right input, for example:

```hcl
# ....

inputs = {
  project           = local.vars.project
  support_email     = local.vars.iap.support_email
  application_title = local.vars.iap.application_title
  bindings          = try([for iam in local.vars.iam : iam if iam["kind"] == "IAP"][0].bindings, {})
}

terraform {
  source = "git::https://github.com/Ki-Insurance/ki-data-tf.git//modules/iap?ref=v1"
}
```
