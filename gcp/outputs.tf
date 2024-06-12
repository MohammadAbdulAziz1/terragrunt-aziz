output "jumphost_public_ip" {
  value = module.landing_zone.jumphost_public_ip
}
output "vm_created" {
  value = module.landing_zone.vm_created
}
output "peering1_created" {
  value = module.landing_zone.peering1_created
}
output "peering2_created" {
  value = module.landing_zone.peering2_created
}
output "peering1_status" {
  value = module.landing_zone.peering1_status
}
output "peering2_status" {
  value = module.landing_zone.peering2_status
}
output "vpn_gateway_created" {
  value = module.landing_zone.vpn_gateway_created
}
