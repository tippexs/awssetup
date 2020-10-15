resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.msc-prod-vpc.id
  route {
    cidr_block = "0.0.0.0/0" //associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.gw.id //CRT uses this IGW to reach internet
  }
  tags = {
    Name = "prod-public-crt"
  }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_route" "main-nat-rt" {
  route_table_id = aws_vpc.msc-prod-vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.gw.id
}


