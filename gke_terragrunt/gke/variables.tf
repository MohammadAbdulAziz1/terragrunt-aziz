variable "gke_cluster_name" {
  type = string
}
variable "gke_cluster_location" {
  type = string
}
variable "gke_cluster_min_master_version" {
  type = string
}
variable "gke_cluster_node_version" {
  type = string
}
variable "gke_prometheus_enabled" {
  type    = bool
  default = true
}
variable "gke_cluster_network" {
  type = string
}
variable "gke_cluster_subnetwork" {
  type = string
}
variable "gke_max_node_count" {
  type = number
}
variable "gke_min_node_count" {
  type = number
}
variable "gke_node_locations" {
  type = list(string)
}
variable "gke_node_disk_size_gb" {
  type = number
}
variable "gke_node_disk_type" {
  type = string
}
variable "gke_node_image_type" {
  type = string
}
variable "gke_node_machine_type" {
  type = string
}
variable "gke_node_oauth_scopes" {
  type = list(string)
}
variable "gke_node_labels" {
  type = map(string)
}
variable "gke_node_max_surge" {
  type = number
}
variable "gke_gce_persistent_disk_csi_driver_config_enabled" {
  type    = bool
  default = true
}
variable "gke_gcs_fuse_csi_driver_config_enabled" {
  type    = bool
  default = true
}
variable "gke_network_policy_enabled" {
  type    = bool
  default = true
}
variable "gke_network_policy_provider" {
  type = string
}
variable "gke_services_ipv4_cidr_block" {
  type = string
}
variable "gke_cluster_dns_domain" {
  type = string
}
variable "gke_cluster_dns" {
  type = string
}
variable "gke_gateway_api_config_channel" {
  type = string
}
variable "gke_resource_labels" {
  type = map(string)
}
variable "gke_cluster_deletion_protection" {
  type    = bool
  default = true
}
variable "gke_node_tags" {
  type = list(string)
}
variable "gke_cluster_release_channel" {
  type = string
}
variable "gcp_project_id" {
  type = string
}
variable "gcp_region" {
  type = string
}
variable "gke_http_load_balancing_disabled" {
  type = bool
}