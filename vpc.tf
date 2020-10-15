resource "aws_vpc" "msc-prod-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags = {
    Name = "msc-prod-vpc"
  }
}


resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id = aws_vpc.msc-prod-vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone = var.aws_az_1a

  tags = {
    Name = "prod-subnet-public-1"
  }
}

resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id = aws_vpc.msc-prod-vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.aws_az_1a

  tags = {
    Name = "prod-subnet-private-1"
  }
}


resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.msc-prod-vpc.id

  tags = {
    Name = "Internet Gateway MSC"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.prod-subnet-public-1.id
  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "NAT GW MSC"
  }
}
