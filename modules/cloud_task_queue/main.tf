resource "google_cloud_tasks_queue" "queue" {
  for_each = { for queue in var.cloud_task_queues : queue.name => queue }
  name     = each.value.name
  location = var.region
  project  = var.project
  rate_limits {
    max_dispatches_per_second = each.value.rate_limits.max_dispatches_per_second
    max_concurrent_dispatches = each.value.rate_limits.max_concurrent_dispatches
  }

  retry_config {
    max_attempts = each.value.retry_config.max_attempts
  }
  stackdriver_logging_config {
    sampling_ratio = each.value.enable_stackdriver ? 1.0 : 0.0
  }
}