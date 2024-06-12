run "jumphost_instance" {
  command = plan

  assert {
    condition     = var.jumphost_name == "jumphostvm"
    error_message = "Invalid jumphost instance name"
  }

  assert {
    condition     = var.jumphost_machine_type == "e2-standard-2"
    error_message = "Invalid jumphost machine type"
  }

  assert {
    condition     = var.zone == "us-central1-a" 
    error_message = "Invalid jumphost zone"
  }

  assert {
    condition     = var.network1 == "peering-vpc1"
    error_message = "Invalid jumphost network"
  }

  assert {
    condition     = var.subnet1 == "test-subnetwork1"
    error_message = "Invalid jumphost subnetwork"
  }

}

run "jumphost_public_ip_validation"{
  command = apply
  
  assert{
    condition = output.jumphost_public_ip != ""
    error_message = "No public ip was created"
  }
}


run "jumphost_instance_creation" {
  command = plan
  assert {
    condition = output.vm_created == true
    error_message = "Jumphost instance should be created"
  }
}
run "vpc_peering" {
  command = plan

  assert {
    condition     = var.peering_name1 == "peering1"
    error_message = "Invalid name for peering1"
  }
  assert{
    condition = var.peering_name2 == "peering2"
    error_message = "Invalid name for peering2"
  }

}

run "peering_creation"{
  command=plan
  assert{
    condition = output.peering1_created == true
    error_message= "the peering1 is not created"
  }
  assert{
    condition = output.peering2_created == true
    error_message= "the peering2 is not created"
  }
}
run "peering_status"{
  command=apply
  assert{
    condition = output.peering1_status == "ACTIVE"
    error_message= "the peering1 is not active"
  }
  assert{
    condition = output.peering2_status == "ACTIVE"
    error_message= "the peering2 is not active"
  }
}
run "vpn_gateway" {
  command = plan

  assert {
    condition     = var.vpn_gw_name == "vpn-gateway"
    error_message = "Invalid name for vpn-gateway"
  }
}
run"vpn_gateway_created"{
  command=apply
  assert{
    condition = output.vpn_gateway_created == true
    error_message= "vpn-gateway not created"
  }
}