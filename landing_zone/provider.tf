terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.26.0"
    }
  }
}
provider "google" {
  project = var.project
  # credentials = "keys.json"
  region = var.region
}
provider "google-beta" {

  # Configuration options
  project = var.project
  # credentials = "keys.json"
  region = var.region

}