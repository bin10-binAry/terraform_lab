data "aws_availability_zones" "ava_zone" {
    state = "available"
}

//Create public subnet
resource "aws_subnet" "public_subnet" {
    count = length(data.aws_availability_zones.ava_zone.names)
    vpc_id = aws_vpc.tf_lab_vpc.id
    cidr_block = var.tf_zone_cidr_pb[count.index]
    availability_zone = var.tf_zone_ava_name[count.index]
    tags = {
      Name = var.tf_zone_name_pb[count.index]
    }
}

//Create Private subnet
resource "aws_subnet" "private_subnet" {
    count = length(data.aws_availability_zones.ava_zone.names)
    vpc_id = aws_vpc.tf_lab_vpc.id
    cidr_block = var.tf_zone_cidr_pv[count.index]
    availability_zone = var.tf_zone_ava_name[count.index]
    tags = {
      Name = var.tf_zone_name_pv[count.index]
    }
}