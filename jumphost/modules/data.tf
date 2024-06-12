data "google_compute_image" "my_image" {
  name = var.jumphost_image
  project = var.project
}