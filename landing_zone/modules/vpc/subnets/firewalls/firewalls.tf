resource "google_compute_firewall" "vpc_firewall" {
  for_each           = var.create_firewall == true ? var.firewall_rules : {}
  name               = each.value.name
  network            = var.vpc_name
  priority           = each.value.priority
  direction          = each.value.direction
  source_ranges      = each.value.source_ranges
  destination_ranges = each.value.destination_ranges
  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

}


