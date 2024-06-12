
resource "google_compute_global_forwarding_rule" "albfwrule" {
  name                  = local.forwarding_rule_name
  target                = google_compute_target_http_proxy.loadbalancerproxy.id
  load_balancing_scheme = local.load_balancing_scheme
  port_range            = var.appgw_backend_http_port
}

resource "google_compute_target_http_proxy" "loadbalancerproxy" {
  name    = local.proxy_name
  url_map = google_compute_url_map.urlrouting.id
}

resource "google_compute_url_map" "urlrouting" {
  name            = local.routing_name
  description     = "url mapping should be done by app requirements"
  default_service = google_compute_backend_service.albbackendserv.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.albbackendserv.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.albbackendserv.id
    }
  }
}

resource "google_compute_backend_service" "albbackendserv" {
  name                  = local.backend_service
  port_name             = local.backend_port_name
  protocol              = local.backend_protocol
  timeout_sec           = 10
  load_balancing_scheme = local.load_balancing_scheme
  health_checks         = [google_compute_health_check.gcphealthcheck.id]
}

resource "google_compute_health_check" "gcphealthcheck" {
  name               = local.health_check_name
  timeout_sec        = 5
  check_interval_sec = 10
  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_firewall" "gcpbaselbfw" {
  name    = local.firewall_name
  network = local.firewall_network
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  source_ranges = ["0.0.0.0/0"]
}
