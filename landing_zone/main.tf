module "vpc" {
  source     = "./modules/vpc"
  vpc_config = var.vpcs
  region     = var.region
  project    = var.project
  auto_create_subnetworks = var.auto_create_subnetworks
}
