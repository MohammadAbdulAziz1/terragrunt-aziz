project     = "base-gcp-421210"
region      = "us-central1"
zone        = "us-central1-a"
service     = "disp"
# custom_tags = { customer_name = "test" }
# custom_tags = "test"

#jumphost
jumphost_name         = "jumphostvm"
jumphost_machine_type = "e2-standard-2"
jumphost_image        = "image-1"
env                   = ["dev"]
custom_labels = {
    environment = "production"
    purpose     = "jump-server"
    
  }

#network
network1                = "peering-vpc1"
subnet1                 = "test-subnetwork1"
subnet1_ip_cidr_range   = "10.2.0.0/16"
firewall1               = "firewall1"
network2                = "peering-vpc2"
subnet2                 = "test-subnetwork2"
subnet2_ip_cidr_range   = "192.168.10.0/24"
firewall2               = "firewall2"
peering_name1           = "peering1"
peering_name2           = "peering2"
source_ranges           = ["0.0.0.0/0"]
auto_create_subnetworks = "false"

#vpn gateway
vpn_gw_name = "vpn-gateway"