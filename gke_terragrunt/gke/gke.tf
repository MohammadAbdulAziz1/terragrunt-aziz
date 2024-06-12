resource "google_container_cluster" "gke_cluster" {
  name     = var.gke_cluster_name
  location = var.gke_cluster_location
  project  = var.gcp_project_id

  release_channel {
    channel = var.gke_cluster_release_channel
  }

  min_master_version = data.google_container_engine_versions.central1b.latest_node_version
  node_version       = data.google_container_engine_versions.central1b.latest_node_version

  workload_identity_config {
    workload_pool = "${var.gcp_project_id}.svc.id.goog"
  }

  monitoring_config {
    managed_prometheus {
      enabled = var.gke_prometheus_enabled
    }
  }

  network    = var.gke_cluster_network
  subnetwork = var.gke_cluster_subnetwork

  node_pool {
    name = "ctrlplanenp"

    autoscaling {
      max_node_count = var.gke_max_node_count
      min_node_count = var.gke_min_node_count
    }

    node_locations = var.gke_node_locations

    node_config {
      disk_size_gb = var.gke_node_disk_size_gb
      disk_type    = var.gke_node_disk_type
      image_type   = var.gke_node_image_type
      machine_type = var.gke_node_machine_type
      oauth_scopes = var.gke_node_oauth_scopes
      labels       = var.gke_node_labels
      tags         = var.gke_node_tags
    }

    upgrade_settings {
      max_surge = var.gke_node_max_surge
    }
  }

  addons_config {

    gce_persistent_disk_csi_driver_config {
      enabled = var.gke_gce_persistent_disk_csi_driver_config_enabled
    }

    http_load_balancing {
      disabled = var.gke_http_load_balancing_disabled
    }

    gcs_fuse_csi_driver_config {
      enabled = var.gke_gcs_fuse_csi_driver_config_enabled
    }
  }

  network_policy {
    enabled  = var.gke_network_policy_enabled
    provider = var.gke_network_policy_provider
  }

  ip_allocation_policy {
    services_ipv4_cidr_block = var.gke_services_ipv4_cidr_block
  }

  dns_config {
    cluster_dns_domain = var.gke_cluster_dns_domain
    cluster_dns        = var.gke_cluster_dns
  }

  gateway_api_config {
    channel = var.gke_gateway_api_config_channel
  }

  resource_labels     = var.gke_resource_labels
  deletion_protection = var.gke_cluster_deletion_protection
}

resource "google_container_node_pool" "namedataplanenp" {
  name    = "dataplanenp"
  cluster = google_container_cluster.gke_cluster.id
  project = var.gcp_project_id

  autoscaling {
    max_node_count = var.gke_max_node_count
    min_node_count = var.gke_min_node_count
  }

  node_locations = var.gke_node_locations

  node_config {
    disk_size_gb = var.gke_node_disk_size_gb
    disk_type    = var.gke_node_disk_type
    image_type   = var.gke_node_image_type
    machine_type = var.gke_node_machine_type
    oauth_scopes = var.gke_node_oauth_scopes
    tags         = var.gke_node_tags
    labels       = var.gke_node_labels
  }

  depends_on = [google_container_cluster.gke_cluster]
}
