#-------------------------------------------------------------#
#                        VPC Variables                        #
#-------------------------------------------------------------#
variable "vpc_cidr" {
  description = "provide a CIDR range for vpc"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "Provide name for a vpc"
  type        = string
  default     = ""
}

variable "ops_subnet_cidr_blocks" {
  description = "provide a CIDR range for the ops subnets"
  type        = list(any)
}

variable "ops_subnet_name" {
  description = "provide a name for ops subnets"
  type        = list(any)
}

variable "ep_subnet_cidr_blocks" {
  description = "provide a CIDR range for the public subnets"
  type        = list(any)
}

variable "ep_subnet_name" {
  description = "provide a name for ep subnets"
  type        = list(any)
}

variable "availability_zones" {
  description = "Provide a list of availability zones for subnet deployment"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "ops_route_table_name" {
  description = "provide a name for ops subnets route table"
  type        = string
}

variable "ep_route_table_name" {
  description = "provide a name for ep subnets route table"
  type        = string
}


#-------------------------------------------------------------#
#                 Generic Input Variables                     #
#-------------------------------------------------------------#
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}
# Business Domain
variable "domain" {
  description = "Business Domain in organization this Infrastructure belongs"
  type        = string
  default     = "SAP"
}
# maintainer
variable "maintainer" {
  description = "maintainer of the person who manages this resource"
  type        = string
  default     = "Harish Pawar"
}
