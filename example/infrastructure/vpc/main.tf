module "vpc" {
  source               = "../../../modules/vpc"
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    name : "vpc01"
  }
}

module "internet_gateway" {
  source = "../../../modules/internet_gateway"
  vpc_id = module.vpc.template.id
  tags = {
    name : "vpc01"
  }
}

module "public_subnet_a" {
  source                  = "../../../modules/subnet"
  vpc_id                  = module.vpc.template.id
  cidr_block              = "10.0.0.0/19"
  availability_zone_id    = "apne1-az4"
  map_public_ip_on_launch = true
  tags = {
    name : "Public Subnet (ap-northeast-1a)"
  }
}

module "public_subnet_c" {
  source                  = "../../../modules/subnet"
  vpc_id                  = module.vpc.template.id
  cidr_block              = "10.0.32.0/19"
  availability_zone_id    = "apne1-az1"
  map_public_ip_on_launch = true
  tags = {
    name : "Public Subnet (ap-northeast-1c)"
  }
}

module "private_subnet_a" {
  source                  = "../../../modules/subnet"
  vpc_id                  = module.vpc.template.id
  cidr_block              = "10.0.64.0/19"
  availability_zone_id    = "apne1-az4"
  map_public_ip_on_launch = false
  tags = {
    name : "Private Subnet (ap-northeast-1a)"
  }
}

module "private_subnet_c" {
  source                  = "../../../modules/subnet"
  vpc_id                  = module.vpc.template.id
  cidr_block              = "10.0.96.0/19"
  availability_zone_id    = "apne1-az1"
  map_public_ip_on_launch = false
  tags = {
    name : "Private Subnet (ap-northeast-1c)"
  }
}

module "nat_gateway_a_eip" {
  source = "../../../modules/eip"
  vpc    = true
}

module "nat_gateway_c_eip" {
  source = "../../../modules/eip"
  vpc    = true
}

module "nat_gateway_a" {
  source        = "../../../modules/nat_gateway"
  subnet_id     = module.public_subnet_a.template.id
  allocation_id = module.nat_gateway_a_eip.template.id
}

module "nat_gateway_c" {
  source        = "../../../modules/nat_gateway"
  subnet_id     = module.public_subnet_c.template.id
  allocation_id = module.nat_gateway_c_eip.template.id
}

module "public_route_table" {
  source     = "../../../modules/route_table/public"
  vpc_id     = module.vpc.template.id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.internet_gateway.template.id
  tags = {
    name : "vpc01 Public Routes"
  }
}

module "public_subnet_a_route_table_association" {
  source         = "../../../modules/route_table/association"
  subnet_id      = module.public_subnet_a.template.id
  route_table_id = module.public_route_table.template.id
}

module "public_subnet_c_route_table_association" {
  source         = "../../../modules/route_table/association"
  subnet_id      = module.public_subnet_c.template.id
  route_table_id = module.public_route_table.template.id
}

module "private_a_route_table" {
  source         = "../../../modules/route_table/private"
  vpc_id         = module.vpc.template.id
  cidr_block     = "0.0.0.0/0"
  nat_gateway_id = module.nat_gateway_a.template.id
  tags = {
    name : "vpc01 Private Routes（AZ_a）"
  }
}

module "private_subnet_a_route_table_association" {
  source         = "../../../modules/route_table/association"
  subnet_id      = module.private_subnet_a.template.id
  route_table_id = module.private_a_route_table.template.id
}

module "private_c_route_table" {
  source         = "../../../modules/route_table/private"
  vpc_id         = module.vpc.template.id
  cidr_block     = "0.0.0.0/0"
  nat_gateway_id = module.nat_gateway_c.template.id
  tags = {
    name : "vpc01 Private Routes（AZ_c）"
  }
}

module "private_subnet_c_route_table_association" {
  source         = "../../../modules/route_table/association"
  subnet_id      = module.private_subnet_c.template.id
  route_table_id = module.private_c_route_table.template.id
}


