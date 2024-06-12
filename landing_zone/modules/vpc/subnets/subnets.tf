resource "google_compute_subnetwork" "vpc_subnet" {
  for_each                 = var.subnets
  name                     = each.value.name
  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = each.value.private_ip_google_access
  network                  = var.vpc_name

}

resource "google_compute_router" "router" {
  for_each = { for k, v in var.subnets : k => v if v.private_ip_google_access }
  name     = each.value.router_name
  region   = var.region
  network  = var.vpc_name
}

resource "google_compute_router_nat" "nat" {
  for_each                           = { for k, v in var.subnets : k => v if v.private_ip_google_access }
  name                               = each.value.nat_name
  provider                           = google-beta
  router                             = google_compute_router.router[each.key].name
  region                             = google_compute_router.router[each.key].region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  type                               = var.type
  subnetwork {
    name                    = google_compute_subnetwork.vpc_subnet[each.key].id
    source_ip_ranges_to_nat = [var.source_ip_ranges_to_nat]
  }
  depends_on = [google_compute_router.router, google_compute_subnetwork.vpc_subnet]
}
module "firewalls" {
  for_each        = var.subnets
  source          = "./firewalls"
  firewall_rules  = each.value.firewall_rules
  create_firewall = each.value.create_firewall
  name            = each.value.name
  vpc_name        = var.vpc_name
  depends_on      = [google_compute_subnetwork.vpc_subnet]
}


