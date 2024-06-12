output "jumphost_public_ip" {
  value = google_compute_instance.jumphost_instance.network_interface[0].access_config[0].nat_ip
}
output "vpc_created" {
  value = google_compute_network.rg_dev_testing_network.name
}
output "subnet_created" {
  value = google_compute_subnetwork.network-with-ip-ranges1.name
}
output "vm_created" {
  value = google_compute_instance.jumphost_instance != null ? true : false
}
output "peering1_created" {
  value = google_compute_network_peering.peering1 != null ? true : false
}
output "peering2_created" {
  value = google_compute_network_peering.peering2 != null ? true : false
}
output "peering1_status" {
  value = google_compute_network_peering.peering1.state
}
output "peering2_status" {
  value = google_compute_network_peering.peering2.state
}
output "vpn_gateway_created" {
  value = google_compute_vpn_gateway.vpn-gateway != null ? true : false
}
