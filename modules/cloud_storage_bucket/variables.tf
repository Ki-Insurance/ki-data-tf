variable "project" {
  type = string
}

variable "iam" {
  type = list(object({
    kind     = string
    bindings = map(list(string))
  }))
  default = []
}

variable "cloud_storage_buckets" {
  type = list(object({
    name                        = string
    location                    = string
    force_destroy               = optional(bool)
    storage_class               = optional(string)
    versioning                  = optional(bool)
    uniform_bucket_level_access = optional(bool)
  }))
  default = []
}
