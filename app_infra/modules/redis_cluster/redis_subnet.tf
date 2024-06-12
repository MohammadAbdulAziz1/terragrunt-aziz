resource "google_compute_network" "redis_network" {
  name                    = var.virutal_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "redis_subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = var.ip_cidr_range
  region        = var.location
  network       = google_compute_network.redis_network.id
  depends_on = [ google_compute_network.redis_network ]
}

resource "google_network_connectivity_service_connection_policy" "redis_connection_policy" {
  name          = var.redis_connection_policy_name
  location      = var.location
  service_class = var.service_class
  description   = var.connection_policy_description
  network       = google_compute_network.redis_network.id
  psc_config {
    subnetworks = [google_compute_subnetwork.redis_subnetwork.id]
  }
  depends_on = [ google_compute_network.redis_network , google_compute_subnetwork.redis_subnetwork ]
}

resource "google_compute_network_firewall_policy" "redis_firewall_policy" {
  name        = var.redis_firewall_policy_name
  description = var.firewall_policy_description
}

resource "google_compute_network_firewall_policy_rule" "redis_firewall_policy_rule" {
  for_each = var.firewall_rule
  action                  = each.value.action
  description             = each.value.description
  direction               = each.value.direction
  disabled                = each.value.disabled
  enable_logging          = each.value.enable_logging
  firewall_policy         = google_compute_network_firewall_policy.redis_firewall_policy.name
  priority                = each.value.priority
  rule_name               = each.value.rule_name
  match {
    src_ip_ranges         = [each.value.src_ip_ranges]
    dest_ip_ranges        = [each.value.dest_ip_ranges]
    layer4_configs {
      ip_protocol = "tcp"
      ports = each.value.ports
    }
  }
  depends_on = [ google_compute_network_firewall_policy.redis_firewall_policy ]
}

resource "google_compute_network_firewall_policy_association" "redis_firewall_policy_association" {
  name              = var.redis_firewall_policy_association_name
  attachment_target = google_compute_network.redis_network.id
  firewall_policy   = google_compute_network_firewall_policy.redis_firewall_policy.name
  depends_on = [ google_compute_network.redis_network , google_compute_network_firewall_policy.redis_firewall_policy ]
}


