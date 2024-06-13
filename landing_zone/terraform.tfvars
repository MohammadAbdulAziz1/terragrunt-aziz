# project                 = "base-gcp-421210"
# region                  = "us-central1"
# auto_create_subnetworks = false
# vpcs = {
#   operations_vpc = {
#     vpc_name = "operations-vpc1"

#     subnet_config = {
#       jumphost_subnet = {
#         name                     = "jumphost-subnet1"
#         ip_cidr_range            = "10.1.0.0/16"
#         region                   = "us-central1"
#         network                  = "vpc_network"
#         private_ip_google_access = false

#         create_firewall = true
#         firewall_rules = {
#           firewall_Ingress = {
#             name               = "jumphost-ingress1"
#             priority           = 1000
#             direction          = "INGRESS"
#             source_ranges      = []
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           },
#           firewall_Egress = {
#             name               = "jumphost-egress1"
#             priority           = 1000
#             direction          = "EGRESS"
#             source_ranges      = []
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           }
#         }
#       }
#       gateway_subnet = {
#         name                     = "gateway-subnet1"
#         ip_cidr_range            = "10.3.0.0/28"
#         region                   = "us-central1"
#         network                  = "vpc_network"
#         private_ip_google_access = false
#         create_firewall          = true
#         firewall_rules = {
#           firewall_Ingress = {
#             name               = "gateway-ingress1"
#             priority           = 1000
#             direction          = "INGRESS"
#             source_ranges      = []
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           },
#           firewall_Egress = {
#             name               = "gateway-egress1"
#             priority           = 1000
#             direction          = "EGRESS"
#             source_ranges      = []
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           }
#         }

#       }
#     }
#   }
#   dev_testing_vpc = {
#     vpc_name = "dev-testing-vpc1"

#     subnet_config = {
#       aks_subnet = {
#         name                     = "aks-subnet1"
#         ip_cidr_range            = "10.2.0.0/24"
#         region                   = "us-central1"
#         network                  = "vpc_network"
#         private_ip_google_access = true
#         router_name              = "aks-router1"
#         nat_name                 = "aks-nat1"
#         create_firewall          = true
#         firewall_rules = {
#           firewall_Ingress = {
#             name               = "aks-ingress1"
#             priority           = 1000
#             direction          = "INGRESS"
#             source_ranges      = ["10.1.0.0/24"]
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           },
#           firewall_Egress = {
#             name               = "aks-egress1"
#             priority           = 1000
#             direction          = "EGRESS"
#             source_ranges      = []
#             destination_ranges = ["10.1.0.0/24"]
#             protocol           = "all"
#             ports              = []

#           }
#         }

#       }
#       sql_subnet = {
#         name                     = "sql-subnet1"
#         ip_cidr_range            = "10.2.1.0/24"
#         region                   = "us-central1"
#         network                  = "vpc_network"
#         private_ip_google_access = false
#         create_firewall          = true
#         firewall_rules = {
#           firewall_Ingress = {
#             name               = "sql-ingress1"
#             priority           = 1000
#             direction          = "INGRESS"
#             source_ranges      = ["10.1.1.0/24"]
#             destination_ranges = []
#             protocol           = "all"
#             ports              = []

#           },
#           firewall_Egress = {
#             name               = "sql-egress1"
#             priority           = 1000
#             direction          = "EGRESS"
#             source_ranges      = []
#             destination_ranges = ["10.1.1.0/24"]
#             protocol           = "all"
#             ports              = []

#           }
#         }
#       }
#       postgres_subnet = {
#         name                     = "postgres-subnet1"
#         ip_cidr_range            = "10.2.2.0/24"
#         region                   = "us-central1"
#         network                  = "vpc_network"
#         private_ip_google_access = false
#         create_firewall          = false
#         firewall_rules           = {}
#       }
#     }
#   }
# }
