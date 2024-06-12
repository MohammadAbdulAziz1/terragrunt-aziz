resource "google_compute_instance" "jumphost_instance" {
  name         = var.jumphost_name
  machine_type = var.jumphost_machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = var.network1
    subnetwork = var.subnet1
    access_config {
    }
    
  }
  
  tags = ["jumphost", "ssh-access"]

  
  labels = local.labels
  depends_on = [ google_compute_network.rg_operations_network,google_compute_subnetwork.network-with-ip-ranges1 ]
}




