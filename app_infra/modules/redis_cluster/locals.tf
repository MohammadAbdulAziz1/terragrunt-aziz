locals {
  default_tags = {
    Service     = var.service
    Environment = var.env
  }
  tags = merge(local.default_tags)
}