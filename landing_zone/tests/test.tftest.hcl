run "vpc" {
  command = apply
  assert {
    condition     = length(module.vpc.vpcs_output) == 2
    error_message = "The value must be equal to two"
  }
}
run "operations_vpc_name"{
    command = plan
    assert{
        condition = var.vpcs.operations_vpc.vpc_name == "operations-vpc1"
        error_message = "Incorrect Name"
    }
}
run "dev_testing_vpc_name"{
    command = plan
    assert{
        condition = var.vpcs.dev_testing_vpc.vpc_name == "dev-testing-vpc1"
        error_message ="Incorrect Name"
    }
}
run "subnet" {
  command = apply
  assert {
    condition     = length(module.vpc.subnets_output) > 0
    error_message = "The value must be greater than 0"
  }
}

run jumphost_subnet_name{
    command=plan
    assert{
        condition=var.vpcs.operations_vpc.subnet_config.jumphost_subnet.name =="jumphost-subnet1"
        error_message = "Incorrect Name"
    }
}
run gateway_subnet_name{
    command=plan
    assert{
        condition=var.vpcs.operations_vpc.subnet_config.gateway_subnet.name =="gateway-subnet1"
        error_message = "Incorrect Name"
    }
}
run aks_subnet_name{
    command=plan
    assert{
        condition=var.vpcs.dev_testing_vpc.subnet_config.aks_subnet.name == "aks-subnet1"
        error_message = "Incorrect Name"
    }
}
run sql_subnet_name{
    command=plan
    assert{
        condition=var.vpcs.dev_testing_vpc.subnet_config.sql_subnet.name == "sql-subnet1"
        error_message = "Incorrect Name"
    }
}
run postgres_subnet_name{
    command=plan
    assert{
        condition=var.vpcs.dev_testing_vpc.subnet_config.postgres_subnet.name == "postgres-subnet1"
        error_message = "Incorrect Name"
    }
}
run "auto_create_subnetworks" {
  command = plan
  assert {
    condition     = var.auto_create_subnetworks == false
    error_message = "auto create subnetworks should be false"
  }
}
run "ip_cidr_range_vpc1" {
  command = plan
  assert {
    condition     = output.ip_range_jumphost_subnet != output.ip_range_gateway_subnet
    error_message = "the ip_cidr_range should not be same for two subnets within the vpc"
  }
}
run "ip_cidr_range_vpc2" {
  command = plan
  assert {
    condition     = output.ip_range_aks_subnet != output.ip_range_sql_subnet
    error_message = "the ip_cidr_range should not be same for two subnets within the vpc"
  }
}
run "router"{
  command= apply
  assert{
    condition=length(output.router) ==1
    error_message="The value must be equal to one"
  }
}
run "router_name"{
  command = plan
  assert{
    condition = var.vpcs.dev_testing_vpc.subnet_config.aks_subnet.router_name == "aks-router1"
    error_message="Incorrect Name"
  }

}
run "nat"{
  command= apply
  assert{
    condition=length(output.nat) ==1
    error_message="The value must be equal to one"
  }
}
run "nat_name"{
  command = plan
  assert{
    condition = var.vpcs.dev_testing_vpc.subnet_config.aks_subnet.nat_name == "aks-nat1"
    error_message="Incorrect Name"
  }
}
run "firewall_rules"{
  command= apply
  assert{
    condition=length(output.firewall_rules) > 0
    error_message="The value must be greater than one"
  }
}
run "subnet_private_ip"{
  command= plan
  assert{
    condition= var.vpcs.operations_vpc.subnet_config.jumphost_subnet.private_ip_google_access==true || var.vpcs.operations_vpc.subnet_config.jumphost_subnet.private_ip_google_access==false
    error_message="can be true or false boolean value"
  }
}

