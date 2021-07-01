module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "devops-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.devops.names
  private_subnets = slice(var.private_subnet_cidr, 0, var.private_subnet_count)
  public_subnets  = slice(var.public_subnet_cidr, 0, var.public_subnet_count)

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = var.resource_tags

  }

data "aws_availability_zones" "devops" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

