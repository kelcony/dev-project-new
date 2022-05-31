# Creating AWS network for a project

resource "aws_vpc" "Rock_test-vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Rock_test-vpc"
  }
}

# Creating  Public Subnet1

resource "aws_subnet" "Rock-test-pub-subnet1" {
  vpc_id            = aws_vpc.Rock_test-vpc.id
  cidr_block        = var.public-subnet1-cidr
  availability_zone = var.az1

  tags = {
    Name = "Rock-test-pub-subnet1"
  }
}

# Creating Public subnet2
resource "aws_subnet" "Rock-test-pub-subnet2" {
  vpc_id            = aws_vpc.Rock_test-vpc.id
  cidr_block        = var.public-subnet2-cidr
  availability_zone = var.az2

  tags = {
    Name = "Rock-test-pub-subnet2"
  }
}

# creating private subnet1
resource "aws_subnet" "Rock-test-priv-subnet1" {
  vpc_id            = aws_vpc.Rock_test-vpc.id
  cidr_block        = var.private-subnet1-cidr
  availability_zone = var.az3

  tags = {
    Name = "Rock-test-priv-subnet1"
  }
}

# Creating Private subnet2
resource "aws_subnet" "Rock-test-priv-subnet2" {
  vpc_id            = aws_vpc.Rock_test-vpc.id
  cidr_block        = var.private-subnet2-cidr
  availability_zone = var.az4

  tags = {
    Name = "Rock-test-priv-subnet2"
  }
}

# Public route table

resource "aws_route_table" "Rock-test-pub-route1" {
  vpc_id = aws_vpc.Rock_test-vpc.id

  route = []

  tags = {
    Name = "Rock-test-pub-route1"
  }
}

# private route table
resource "aws_route_table" "Rock-test-priv-route1" {
  vpc_id = aws_vpc.Rock_test-vpc.id

  route = []

  tags = {
    Name = "Rock-test-priv-route1"
  }
}

# Associate public subnet1 with public route table

resource "aws_route_table_association" "Rock-test-pub-association1" {
  subnet_id      = aws_subnet.Rock-test-pub-subnet1.id
  route_table_id = aws_route_table.Rock-test-pub-route1.id
}

# Associate public subnet2 with public route table

resource "aws_route_table_association" "Rock-test-pub-association2" {
  subnet_id      = aws_subnet.Rock-test-pub-subnet2.id
  route_table_id = aws_route_table.Rock-test-pub-route1.id
}

# Associate private subnet1 with private route table

resource "aws_route_table_association" "Rock-test-priv-association1" {
  subnet_id      = aws_subnet.Rock-test-priv-subnet1.id
  route_table_id = aws_route_table.Rock-test-priv-route1.id
}

# Associate private subnet2 with public route table

resource "aws_route_table_association" "Rock-test-priv-association2" {
  subnet_id      = aws_subnet.Rock-test-priv-subnet2.id
  route_table_id = aws_route_table.Rock-test-priv-route1.id
}

# Creating internet Gateway

resource "aws_internet_gateway" "Rock-test-IGW" {
  vpc_id = aws_vpc.Rock_test-vpc.id

  tags = {
    Name = "Rock-test-IGW"
  }
}

# Associating internet Gateway with Public route table

resource "aws_route" "Rock-IGW-attachment" {
  route_table_id         = aws_route_table.Rock-test-pub-route1.id
  gateway_id             = aws_internet_gateway.Rock-test-IGW.id
  destination_cidr_block = var.route-table
}
