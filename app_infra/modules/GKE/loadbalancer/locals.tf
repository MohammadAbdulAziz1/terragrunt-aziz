locals {
  firewall_name = "allow-http-traffic-gcp-base"

  forwarding_rule_name = "forwading-rule-gcp-base"

  proxy_name = "target-proxy-gcp-base"

  routing_name = "url-map-target-proxy-gcp-base"

  backend_protocol = "HTTP"

  backend_port_name = "http"

  health_check_name = "tcp-proxy-health-check1"

  backend_service = "app-load-balancer"

  load_balancing_scheme = "EXTERNAL"

  firewall_network = "default"


}
