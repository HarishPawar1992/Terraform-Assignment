#--------------------------------------------------------------------------#
#             Terraform resource to Create NACL                            #
#--------------------------------------------------------------------------#

resource "aws_network_acl" "ops_nacl" {
  vpc_id     = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name        = "ops_nacl"
    environment = var.environment
    maintainer  = var.maintainer
  }
}

resource "aws_network_acl" "ep_nacl" {
  vpc_id     = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name        = "ep_nacl"
    environment = var.environment
    maintainer  = var.maintainer
  }
}


/*
resource "aws_network_acl_association" "ops_nacl_association" {
  count          = length(var.ops_subnet_cidr_blocks)
  network_acl_id = aws_network_acl.ops_nacl.id
  subnet_id      = aws_subnet.ops_subnets[count.index].id
}

resource "aws_network_acl_association" "ep_nacl_association" {
  count          = length(var.ep_subnet_cidr_blocks)
  network_acl_id = aws_network_acl.ep_nacl.id
  subnet_id      = aws_subnet.ep_subnets[count.index].id
}

*/