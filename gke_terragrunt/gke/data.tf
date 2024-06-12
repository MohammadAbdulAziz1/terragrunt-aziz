data "google_container_engine_versions" "central1b" {
    project = var.gcp_project_id
  provider       = google-beta
  location       = "us-central1-b"
  # version_prefix = "1.12."
}
