variable "firewall_name" {
  type = string
}

variable "forwarding_rule_name" {
  type = string
}

variable "proxy_name" {
  type = string
}

variable "routing_name" {
  type = string
}



variable "backend_protocol" {
  type = string
}

variable "backend_port_name" {
  type = string
}

variable "health_check_name" {
  type = string
}

variable "backend_service" {
  type = string
}

variable "firewall_network" {
  type = string
  default = "default"
}

variable "load_balancing_scheme" {
  type = string
  default = "EXTERNAL"
}
variable "appgw_backend_http_port" {
  type    = number
  default = 80
}