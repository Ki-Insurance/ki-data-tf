variable "azure_roles" {
  type = list(object({
    name        = string
    scope       = string
    permissions = list(string)
  }))
  default = []
}