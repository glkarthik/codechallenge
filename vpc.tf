resource "aws_vpc" "codechallenge-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "codechallenge"
  }
}