#-----------------------------------------------------------#
#                       Variables                           #
#-----------------------------------------------------------#
aws_region             = "ap-southeast-1"
environment            = "Dev"
maintainer             = "Harish Pawar"
vpc_cidr               = "192.168.50.0/24"
vpc_name               = "vpc-mgmt-dzenv"
availability_zones     = ["ap-southeast-1a", "ap-southeast-1b"]
ops_subnet_cidr_blocks = ["192.168.50.160/28", "192.168.50.176/28"]
ep_subnet_cidr_blocks  = ["192.168.50.192/27", "192.168.50.224/27"]
ep_subnet_name         = ["sub-mgmt-dzenv-ep1", "sub-mgmt-dzenv-ep2"]
ops_subnet_name        = ["sub-mgmt-dzenv-ops1", "sub-mgmt-dzenv-ops2"]
ops_route_table_name   = "rt-customer-project-mgmt-dzenv-ops"
ep_route_table_name    = "rt-customer-project-mgmt-dzenv-ep"