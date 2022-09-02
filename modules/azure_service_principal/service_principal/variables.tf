variable "service_principal" {
  type = object({
    name     = string
    owners   = list(string)
    duration = optional(string)
  })
}
