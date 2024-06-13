variable "subnets" {
  type = any
}

variable "vpc_name" {
  type = string

  # validation {
  #   condition     = length(var.vpc_name) > 0
  #   error_message = "VPC network name must not be empty."
  # }
}
variable "region" {
  type = string
}
variable "nat_ip_allocate_option" {
  type    = string
  default = "AUTO_ONLY"
}
variable "source_subnetwork_ip_ranges_to_nat" {
  type    = string
  default = "LIST_OF_SUBNETWORKS"

}
variable "type" {
  default = "PUBLIC"
}
variable "source_ip_ranges_to_nat" {
  type    = any
  default = "ALL_IP_RANGES"
}


