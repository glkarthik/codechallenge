resource "aws_subnet" "codechallenge-public-subnet-2a" {
  vpc_id                  = aws_vpc.codechallenge-vpc.id
  cidr_block              = "10.0.0.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "codechallenge"
  }
}

resource "aws_subnet" "codechallenge-public-subnet-2b" {
  vpc_id                  = aws_vpc.codechallenge-vpc.id
  cidr_block              = "10.0.32.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "codechallenge"
  }
}
