resource "aws_route_table" "codechallenge-route-public" {
  vpc_id = aws_vpc.codechallenge-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.codechallenge-igw.id
  }


  tags = {
    Name = "codechallenge"
  }
}


resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.codechallenge-public-subnet-2a.id
  route_table_id = aws_route_table.codechallenge-route-public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  subnet_id      = aws_subnet.codechallenge-public-subnet-2b.id
  route_table_id = aws_route_table.codechallenge-route-public.id
}
