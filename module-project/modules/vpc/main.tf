resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
  
}

resource "aws_subnet" "vpc_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone

    tags = {
      Name = "vpc-subnet"
    }
  
}