variable "secret" {
  type = object({
    name                      = string
    value_from_iap_credential = optional(string)
  })
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "replica_region" {
  type = string
}
