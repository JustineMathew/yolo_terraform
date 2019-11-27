# Define VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr[local.env]
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "${local.env}-yolo"
  }
}

# Defining  public subnet's
resource "aws_subnet" "public_subnet" {
  count             = length(var.publicsubet_name[local.env])
  vpc_id            = aws_vpc.vpc.id
  map_public_ip_on_launch  =true
  cidr_block        = cidrsubnet(var.vpc_cidr[local.env], var.cidr_newbits[local.env], element(var.nicevalue_public[local.env],count.index))
  availability_zone = "ap-southeast-1${element(var.subnet_suffix[local.env],count.index)}"

  tags = {
    Name = "${local.env}-${element(var.publicsubet_name[local.env],count.index)}"
  }
}

# Define private  subnet's
resource "aws_subnet" "private_subnet" {
  count             = length(var.privatesubnet_name[local.env])
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.privatesubnet_ip[local.env],count.index)
  availability_zone = "ap-southeast-1${element(var.subnet_suffix[local.env],count.index)}"

  tags = {
    Name = "${local.env}-${element(var.privatesubnet_name[local.env],count.index)}"
 }
}




# Define the internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.env}-igw"
  }
}
