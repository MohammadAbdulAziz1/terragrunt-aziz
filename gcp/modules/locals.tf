locals {
  default_labels = {
    service     = var.service
    environment = "test"
  }
   labels = merge(local.default_labels, var.custom_labels)
}