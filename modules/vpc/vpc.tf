#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "demo" {
  cidr_block = "${var.vpc_cidr}"
  tags = "${
    map(
     "Name", "${var.vpc_name_tag}" ,
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "demo" {
  count = "${var.vpc_subnet_count}"	
  availability_zone = "${var.availability-zones[count.index]}"
  #cidr_block        = "10.0.${count.index}.0/24"
  cidr_block        =  "${var.vpc_subnet_cidr_block[count.index]}"
  vpc_id            = "${aws_vpc.demo.id}"
  tags = "${
    map(
     "Name", "${var.vpc_name_tag}" ,
     "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "demo" {
  vpc_id = "${aws_vpc.demo.id}"

  tags {
    Name = "${var.vpc_internet_gateway_name_tag}"
  }
}

resource "aws_route_table" "demo" {
  vpc_id = "${aws_vpc.demo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo.id}"
  }
}

resource "aws_route_table_association" "demo" {
  count = 2
  subnet_id      = "${aws_subnet.demo.*.id[count.index]}"
  route_table_id = "${aws_route_table.demo.id}"
}
