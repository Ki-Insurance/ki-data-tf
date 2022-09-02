variable "cloud_task_queues" {
  type = list(object({
    name = string
    rate_limits = object({
      max_dispatches_per_second = number
      max_concurrent_dispatches = number
    })
    retry_config = object({
      max_attempts = number
    })
    enable_stackdriver = bool
  }))
  default = []
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "project" {
  type = string
}
