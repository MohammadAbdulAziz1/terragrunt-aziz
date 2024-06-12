resource "google_compute_vpn_gateway" "vpn-gateway" {
  name    = var.vpn_gw_name
  network = var.network1
  region = var.region
depends_on = [google_compute_network.rg_operations_network]
}
