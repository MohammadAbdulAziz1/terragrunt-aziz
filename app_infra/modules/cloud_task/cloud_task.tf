resource "google_cloud_tasks_queue" "cloud_task" {
  name     = var.cloud_task_name
  location = var.location

  app_engine_routing_override {
    service  = var.app_engine_service
    version  = var.app_engine_version
    instance = var.app_engine_instance
  }

  rate_limits {
    max_concurrent_dispatches = var.max_concurrent_dispatches
    max_dispatches_per_second = var.max_dispatches_per_second
  }

  retry_config {
    max_retry_duration = var.retry_max_duration
    max_backoff        = var.retry_max_backoff
    min_backoff        = var.retry_min_backoff
    max_doublings      = var.retry_max_doublings
  }

  stackdriver_logging_config {
    sampling_ratio = var.sampling_ratio
  }
}
