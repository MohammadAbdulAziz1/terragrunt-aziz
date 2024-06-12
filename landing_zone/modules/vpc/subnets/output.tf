output "subnets_output" {
  value = {for k , v in google_compute_subnetwork.vpc_subnet: k=>v.name}
}
output "ip_cidr_range" {
  value = {for k,v in google_compute_subnetwork.vpc_subnet : k=>v.ip_cidr_range}
}
output "router" {
  value = {for k,v in google_compute_router.router : k=>v.name}
}
output "nat" {
  value = {for k,v in google_compute_router_nat.nat : k=>v.name}
}
output "firewall_rules" {
  value = {for k , v in module.firewalls: k=> v}
}