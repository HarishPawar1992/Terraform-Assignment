locals {
  ops_sg_tags = {
    key         = "sg-mgmt-dzenv-ops"
    Name        = "sgrp-customer-project-mgmt-dzenv-ops"
    description = "Security Groups for Gitlab Runners"
  }

  ep_sg_tags = {
    key         = "sg-mgmt-dzenv-ep"
    Name        = "sgrp-customer-project-mgmt-dzenv-ep"
    description = "Security Groups for VPC Endpoints"
  }

  ops_subnet_tags = {
    tier    = "devops"
    segment = "private"
    zone    = "mz"
  }

  ep_subnet_tags = {
    tier    = "endpoint"
    segment = "private"
    zone    = "mz"
  }

}
