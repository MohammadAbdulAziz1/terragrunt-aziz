variable "project" {
  type = string
  validation  {
   condition     = var.project == "base-gcp-421210"
   error_message = "VPC network name must not be empty."
  }
}
variable "region" {
  type = string

  validation {
   condition     = var.region == "us-central1"
   error_message = "VPC network name must not be empty."
}
}
variable "vpcs" {
  type = any
}
variable "auto_create_subnetworks" {
  type = bool
}
