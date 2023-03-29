resource "aws_subnet" "codechallenge-public-subnet-2a" {
  vpc_id                  = aws_vpc.codechallenge-vpc.id
  cidr_block              = var.cidr_block_a
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    "Name" = "codechallenge"
  }
}

resource "aws_subnet" "codechallenge-public-subnet-2b" {
  vpc_id                  = aws_vpc.codechallenge-vpc.id
  cidr_block              = var.cidr_block_b
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = {
    "Name" = "codechallenge"
  }
}
