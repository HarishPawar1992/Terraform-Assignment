#--------------------------------------------------------------------------#
#             Terraform resource to Create AWS VPC SG                      #
#--------------------------------------------------------------------------#
resource "aws_security_group" "ops_sg" {
  name        = "sgrp-customer-project-mgmt-dzenv-ops"
  description = "Security Groups for Gitlab Runners"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow SSH from org network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      environment = var.environment
      maintainer  = var.maintainer
    },
    local.ops_sg_tags
  )
}

resource "aws_security_group" "ep_sg" {
  name        = "sgrp-customer-project-mgmt-dzenv-ep"
  description = "Security Groups for VPC Endpoints"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow HTTP from org network"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      environment = var.environment
      maintainer  = var.maintainer
    },
    local.ep_sg_tags
  )
}