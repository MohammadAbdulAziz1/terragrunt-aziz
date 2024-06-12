variable "project" {
  # type = string

  # validation {
  #   condition = var.project == "bhjsabhj"
  #   error_message = "error in priject name"
  # }
}
variable "region" {

}
variable "zone" {

}
variable "service" {

}
#jumphost
variable "jumphost_name" {

}
variable "jumphost_machine_type" {

}
variable "jumphost_image" {

}
variable "env" {
  type = list(string)
}
variable "custom_labels" {
  
}

#network
variable "network1" {

}
variable "subnet1" {

}
variable "subnet1_ip_cidr_range" {

}
variable "firewall1" {

}
variable "network2" {

}
variable "subnet2" {

}
variable "subnet2_ip_cidr_range" {

}
variable "firewall2" {

}
variable "source_ranges" {

}
variable "peering_name1" {

}
variable "peering_name2" {

}
variable "auto_create_subnetworks" {

}
variable "protocol" {
  default = "all"
}

#vpn gateway
variable "vpn_gw_name" {

}