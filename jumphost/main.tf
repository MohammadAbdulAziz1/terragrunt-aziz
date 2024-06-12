module "landing_zone" {
  source  = "./modules"
  project = var.project

  jumphost_name         = var.jumphost_name
  jumphost_machine_type = var.jumphost_machine_type
  jumphost_image        = var.jumphost_image
  region                = var.region
  custom_labels = var.custom_labels

  network1                = var.network1
  subnet1                 = var.subnet1
  subnet1_ip_cidr_range   = var.subnet1_ip_cidr_range
  firewall1               = var.firewall1
  network2                = var.network2
  subnet2                 = var.subnet2
  subnet2_ip_cidr_range   = var.subnet2_ip_cidr_range
  firewall2               = var.firewall2
  peering_name1           = var.peering_name1
  peering_name2           = var.peering_name2
  source_ranges           = var.source_ranges
  auto_create_subnetworks = var.auto_create_subnetworks

  vpn_gw_name = var.vpn_gw_name

  zone    = var.zone
  env     = var.env
  service = var.service


}
