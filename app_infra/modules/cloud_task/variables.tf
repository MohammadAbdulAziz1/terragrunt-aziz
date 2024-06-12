variable "cloud_task_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_engine_service" {
  type = string
}

variable "app_engine_version" {
  type = string
}

variable "app_engine_instance" {
  type = string
}

variable "max_concurrent_dispatches" {
  type = number
}

variable "max_dispatches_per_second" {
  type = number
}

variable "iam_roles" {
  type = string
}

variable "retry_max_duration" {
  type = string
}

variable "retry_max_backoff" {
  type = string
}

variable "retry_min_backoff" {
  type = string
}

variable "retry_max_doublings" {
  type = number
}

variable "sampling_ratio" {
  type = number
}

variable "project_id" {
  type = string
}

variable "iam_members" {
  type = set(string)
}