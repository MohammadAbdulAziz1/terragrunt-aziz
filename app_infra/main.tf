module "redis_cluster" {
  count = var.create_memstore ? 1 : 0
  source                                 = "./modules/redis_cluster"
  redis_firewall_policy_name             = "test-firewall-policy"
  redis_connection_policy_name           = "redis_pcs"
  redis_firewall_policy_association_name = "redis-firewall-assoc"
  firewall_rule = {
    firewall_rule-1 = {
      action         = "allow"
      description    = "Inbound Allow"
      direction      = "INGRESS"
      disabled       = false
      enable_logging = true
      priority       = 100
      rule_name      = "InboundRule"
      src_ip_ranges  = "0.0.0.0/0"
      dest_ip_ranges = ""
      ports          = [22, 6379]
    }
  }
}

module "cloud_tasks" {
  for_each                  = var.create_cloud_task ? var.queue_role : {}
  source                    = "./modules/cloud_task"
  cloud_task_name           = "backupdrss1"
  location                  = "us-central1"
  app_engine_service        = "default"
  app_engine_version        = "1.0"
  app_engine_instance       = "test"
  max_concurrent_dispatches = 1000
  max_dispatches_per_second = 500.0
  retry_max_duration        = "4s"
  retry_max_backoff         = "3600s"
  retry_min_backoff         = "0.100s"
  retry_max_doublings       = 16
  sampling_ratio            = 0.9
  iam_roles                 = each.value.iam_roles
  project_id                = "base-gcp-421210"
  iam_members               = ["user:shravan@tivonaglobal.com", ]
}

module "application_gateway" {
  count                = var.create_loadbalancer ? 1 : 0
  source               = "./modules/GKE/loadbalancer"
  backend_service      = var.backend_Service
  backend_port_name    = var.backend_port_name
  routing_name         = var.routing_name
  backend_protocol     = var.backend_protocol
  health_check_name    = var.health_check_name
  forwarding_rule_name = var.forwarding_rule_name
  proxy_name           = var.proxy_name
  firewall_name        = var.firewall_name

}