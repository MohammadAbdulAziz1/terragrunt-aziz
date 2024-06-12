output "vpcs" {
  value = module.vpc.vpcs_output
}
output "subnets" {
  value = module.vpc.subnets_output
}
output "ip_range_jumphost_subnet" {
  value = module.vpc.ip_cidr_range["operations_vpc"]["ip_cidr_range"]["jumphost_subnet"]
}
output "ip_range_gateway_subnet" {
  value = module.vpc.ip_cidr_range["operations_vpc"]["ip_cidr_range"]["gateway_subnet"]
}
output "ip_range_aks_subnet" {
  value = module.vpc.ip_cidr_range["dev_testing_vpc"]["ip_cidr_range"]["aks_subnet"]
}
output "ip_range_sql_subnet" {
  value = module.vpc.ip_cidr_range["dev_testing_vpc"]["ip_cidr_range"]["sql_subnet"]
}
output "ip_range_postgres_subnet" {
  value = module.vpc.ip_cidr_range["dev_testing_vpc"]["ip_cidr_range"]["postgres_subnet"]
}
output "router" {
  value = module.vpc.router["dev_testing_vpc"]["router"]
}
output "nat" {
  value = module.vpc.nat["dev_testing_vpc"]["nat"]
}
output "firewall_rules" {
  value = module.vpc.firewall_rules
}


