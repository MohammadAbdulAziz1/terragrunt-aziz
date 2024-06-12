resource "google_compute_firewall" "firewall1" {
  name          = var.firewall1
  network       = var.network1
  source_ranges = var.source_ranges


  allow {
    protocol = var.protocol
  }
  depends_on = [google_compute_network.rg_operations_network, google_compute_subnetwork.network-with-ip-ranges1]

}
resource "google_compute_firewall" "firewall2" {
  name          = var.firewall2
  network       = var.network2
  source_ranges = var.source_ranges

  allow {
    protocol = var.protocol
  }

  depends_on = [google_compute_network.rg_dev_testing_network, google_compute_subnetwork.network-with-ip-ranges2]
}
resource "google_compute_network" "rg_operations_network" {
  name                    = var.network1
  auto_create_subnetworks = var.auto_create_subnetworks

}
resource "google_compute_subnetwork" "network-with-ip-ranges1" {
  name          = var.subnet1
  ip_cidr_range = var.subnet1_ip_cidr_range
  region        = var.region
  network       = var.network1

  depends_on = [google_compute_network.rg_operations_network]
}
resource "google_compute_network" "rg_dev_testing_network" {
  name                    = var.network2
  auto_create_subnetworks = var.auto_create_subnetworks

}
resource "google_compute_subnetwork" "network-with-ip-ranges2" {
  name          = var.subnet2
  ip_cidr_range = var.subnet2_ip_cidr_range
  region        = var.region
  network       = var.network2
  depends_on    = [google_compute_network.rg_dev_testing_network]
}

resource "google_compute_network_peering" "peering1" {
  name         = var.peering_name1
  network      = google_compute_network.rg_operations_network.self_link
  peer_network = google_compute_network.rg_dev_testing_network.self_link
  depends_on = [ google_compute_network.rg_operations_network, google_compute_network.rg_dev_testing_network ]
}

resource "google_compute_network_peering" "peering2" {
  name         = var.peering_name2
  network      = google_compute_network.rg_dev_testing_network.self_link
  peer_network = google_compute_network.rg_operations_network.self_link
  depends_on = [ google_compute_network.rg_dev_testing_network, google_compute_network.rg_operations_network ]
}
