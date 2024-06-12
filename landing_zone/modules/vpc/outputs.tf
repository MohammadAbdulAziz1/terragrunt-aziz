output "vpcs_output" {
  value = { for k, v in google_compute_network.vpc_network : k => v.name }
}
output "subnets_output" {
  value = { for k, v in module.subnets : k => v }
}
output "ip_cidr_range" {
  value = { for k, v in module.subnets : k => v }
}
output "router" {
  value = { for k, v in module.subnets : k => v }
}
output "nat" {
  value = { for k, v in module.subnets : k => v }
}
output "firewall_rules" {
  value = { for k, v in module.subnets : k => v }
}

