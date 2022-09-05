variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "iam" {
  type = list(object({
    resource = string
    bindings = map(list(string))
  }))
  default = []
}

variable "cloud_functions" {
  type = list(object({
    name                  = string
    entry_point           = string
    archive_bucket        = string
    archive_path          = string
    description           = string
    runtime               = string
    service_account_email = string
    available_memory_mb   = number
    timeout               = optional(number)
    max_instances         = optional(number)
    min_instances         = optional(number)
    environment_variables = optional(map(string))
    secret_environment_variables = optional(list(object({
      key    = string,
      secret = string
    })))
  }))
  default = []
}
