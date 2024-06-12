# gke_cluster_name               = "gke-cluster"
# gke_cluster_location           = "us-central1"
# gke_cluster_min_master_version = "1.28.8-gke.1095000"
# gke_cluster_node_version       = "1.28.8-gke.1095000"
# gke_prometheus_enabled         = true
# gke_cluster_network            = "default"
# gke_cluster_subnetwork         = "default"
# gke_max_node_count             = 2
# gke_min_node_count             = 1
# gke_node_locations             = ["us-central1-c"]
# gke_node_disk_size_gb          = 100
# gke_node_disk_type             = "pd-balanced"
# gke_node_image_type            = "COS_CONTAINERD"
# gke_node_machine_type          = "e2-micro"
# gke_node_oauth_scopes = [
#   "https://www.googleapis.com/auth/devstorage.read_only",
#   "https://www.googleapis.com/auth/logging.write",
#   "https://www.googleapis.com/auth/monitoring",
#   "https://www.googleapis.com/auth/servicecontrol",
#   "https://www.googleapis.com/auth/service.management.readonly",
#   "https://www.googleapis.com/auth/trace.append"
# ]
# gke_node_labels = {
#   "nodepool" = "gke-nodepool"
# }
# gke_node_max_surge                                = 1
# gke_gce_persistent_disk_csi_driver_config_enabled = true
# gke_gcs_fuse_csi_driver_config_enabled            = true
# gke_network_policy_enabled                        = true
# gke_network_policy_provider                       = "CALICO"
# gke_services_ipv4_cidr_block                      = "172.16.0.0/24"
# gke_cluster_dns_domain                            = "tivonadns"
# gke_cluster_dns                                   = "CLOUD_DNS"
# gke_gateway_api_config_channel                    = "CHANNEL_STANDARD"
# gke_resource_labels = {
#   "cluster" = "gke-cluster"
# }
# gke_cluster_deletion_protection  = false
# gke_cluster_release_channel      = "REGULAR"
# gke_node_tags                    = ["gke-node"]
# gcp_project_id                   = "base-gcp-421210"
# gcp_region                       = "us-central1"
# gke_http_load_balancing_disabled = false