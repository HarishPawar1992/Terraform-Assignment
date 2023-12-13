#--------------------------------------------------------------------------#
#             Terraform resource to Create AWS VPC & Subnets               #
#--------------------------------------------------------------------------#

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = var.vpc_name
    environment = var.environment
    maintainer  = var.maintainer
  }
}

#resource to create ops subnets
resource "aws_subnet" "ops_subnets" {
  count = length(var.ops_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ops_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    {
      Name        = var.ops_subnet_name[count.index]
      environment = var.environment
      maintainer  = var.maintainer
    },
    local.ops_subnet_tags
  )
}

#resource to create ep subnets
resource "aws_subnet" "ep_subnets" {
  count = length(var.ep_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ep_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    {
      Name        = var.ep_subnet_name[count.index]
      environment = var.environment
      maintainer  = var.maintainer
    },
    local.ep_subnet_tags
  )
}

#resource to create route tables for ops subnets
resource "aws_route_table" "ops_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = var.ops_route_table_name
    environment = var.environment
    maintainer  = var.maintainer
  }
}

#resource to create route tables for ep subnets
resource "aws_route_table" "ep_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = var.ep_route_table_name
    environment = var.environment
    maintainer  = var.maintainer
  }
}

#resource to create route tables associations for ops subnets
resource "aws_route_table_association" "ops_route_table_association" {
  count = length(var.ops_subnet_cidr_blocks)

  subnet_id      = aws_subnet.ops_subnets[count.index].id
  route_table_id = aws_route_table.ops_route_table.id
}

#resource to create route tables associations for ep subnets
resource "aws_route_table_association" "ep_route_table_association" {
  count = length(var.ep_subnet_cidr_blocks)

  subnet_id      = aws_subnet.ep_subnets[count.index].id
  route_table_id = aws_route_table.ep_route_table.id
}