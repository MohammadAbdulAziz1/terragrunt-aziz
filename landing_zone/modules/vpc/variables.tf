
variable "vpc_config" {
  type = any
}
variable "region" {
  type = string

}
variable "project" {
  
}

variable "auto_create_subnetworks" {
  type = bool
  default = false
}


