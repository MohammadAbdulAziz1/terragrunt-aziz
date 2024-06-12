variable "project" {
  
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
  type = any
  
  default = {
    environment = "production"
    purpose     = "jump-server"
    
  }
  
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
variable "auto_create_subnetworks" {

}
variable "network2" {

}
variable "subnet2" {

}
variable "subnet2_ip_cidr_range" {

}
variable "firewall2" {

}
variable "peering_name1" {

}
variable "peering_name2" {

}
variable "protocol" {
  default = "all"
}
variable "source_ranges" {
  default  = ["0.0.0.0/0"]
}
#vpn gateway
variable "vpn_gw_name" {

}
