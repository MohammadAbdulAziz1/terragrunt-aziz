resource "google_compute_network" "vpc_network" {
  for_each                = var.vpc_config
  name                    = each.value.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  #  lifecycle {
  #   precondition {
  #     condition     = var.auto_create_subnetworks == false
  #     error_message = "auto_create_subnetworks must be false for custom subnet creation."
  #   }
  #   postcondition {
  #     condition     = length(self.name) > 0
  #     error_message = "VPC network must be created successfully."
  #   }
  # }
}


module "subnets" {
  for_each = var.vpc_config
  source   = "./subnets"
  subnets  = each.value.subnet_config
  vpc_name = google_compute_network.vpc_network[each.key].name
  region   = var.region
}

