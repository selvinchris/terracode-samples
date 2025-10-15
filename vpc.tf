# resource "aws_vpc" "vpc1" {
#
#   cidr_block = "10.0.0.0/20"
#   tags = {
#
#     Name = "terra-vpc"
#   }
# }
#
# resource "aws_subnet" "sub1" {
#   vpc_id                  = aws_vpc.vpc1.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "us-east-1d"
#
# }
#
# resource "aws_subnet" "sub2" {
#   vpc_id = aws_vpc.vpc1.id
#
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
# }
#
# resource "aws_internet_gateway" "igw1" {
#
#   vpc_id = aws_vpc.vpc1.id
#
# }
#
# resource "aws_route_table" "rt1" {
#   vpc_id = aws_vpc.vpc1.id
#
#   route {
#
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw1.id
#   }
#
# }
#
# resource "aws_route_table_association" "rt1-ass" {
#   route_table_id = aws_route_table.rt1.id
#   subnet_id      = aws_subnet.sub1.id
# }
#
# resource "aws_route_table_association" "rt2-ass" {
#   route_table_id = aws_route_table.rt1.id
#   subnet_id      = aws_subnet.sub2.id
# }
#
# resource "aws_security_group" "terra-sg" {
#
#   vpc_id = aws_vpc.vpc1.id
#   ingress {
#
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#   }
#   ingress {
#
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#   }
#   egress {
#
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }
# }