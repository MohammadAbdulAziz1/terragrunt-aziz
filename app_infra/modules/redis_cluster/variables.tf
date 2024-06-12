variable "env" {
  type = string
  default = "testing"
}

variable "service" {
    type = string
    default = "caching"
}

# variable "custom_tags" {
#   type = any
# }

variable "virutal_network_name" {
  type = string
  default = "redisvnet"
}

variable "auto_create_subnetworks" {
  type = bool
  default = false
}

variable "subnetwork_name" {
  type = string
  default = "redissubnet"
}

variable "ip_cidr_range" {
    type = string
    default = "10.2.0.0/24"
}

variable "location" {
    type = string
    default = "us-west1"
}

variable "redis_firewall_policy_name" {
  type = string
}

variable "firewall_policy_description" {
    type = string
    default = "Firewall Policy for Redis Clusters"
}

variable "firewall_rule" {
  type = any
}

variable "redis_firewall_policy_association_name" {
  type = string
}

variable "redis_connection_policy_name" {
  type = string
}

variable "connection_policy_description" {
  type = string
  default = "Redis Connection Policy"
}

variable "service_class" {
  type = string
  default = "gcp-memorystore-redis"
}

variable "shard_count" {
  type = number
  default = 3
}

variable "replica_count" {
  type = number
  default = 1
}

variable "node_type" {
  type = string
  default = "REDIS_SHARED_CORE_NANO"
}

variable "transit_encryption_mode" {
  type = string
  default = "TRANSIT_ENCRYPTION_MODE_DISABLED"
}

variable "authorization_mode" {
  type = string
  default = "AUTH_MODE_DISABLED"
}