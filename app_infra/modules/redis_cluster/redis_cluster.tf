resource "google_redis_cluster" "redis_cluster" {
  name = "rediscluster-${var.env}-${var.service}"
  psc_configs {
    network = google_compute_network.redis_network.id
  }
  region                  = var.location
  node_type               = var.node_type
  shard_count             = var.node_type == "REDIS_HIGHMEM_XLARGE" ? var.shard_count : 3
  replica_count           = var.node_type == "REDIS_HIGHMEM_XLARGE" ? var.replica_count : null
  transit_encryption_mode = var.transit_encryption_mode
  authorization_mode      = var.authorization_mode
  depends_on = [
    google_network_connectivity_service_connection_policy.redis_connection_policy
  ]
}
