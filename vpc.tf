//Create VPC
resource "aws_vpc" "tf_lab_vpc" {
    cidr_block = "10.10.0.0/16"
    tags = {
      Name = "Assignment_TF_lab"
    }
}

//Create Internet Gateway
resource "aws_internet_gateway" "tf_lab_igw" {
    tags = {
      Name = "TF-Lab_IGW"
    }
}

//Attach Internet Gateway to VPC
resource "aws_internet_gateway_attachment" "IGW_VPC" {
    vpc_id = aws_vpc.tf_lab_vpc.id
    internet_gateway_id = aws_internet_gateway.tf_lab_igw.id
}

//Create Public Route Table
resource "aws_route_table" "tf_lab_pub_rtb" {
    vpc_id = aws_vpc.tf_lab_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_lab_igw.id
    }
    tags = {
        Name = var.tf_lab_pub_rtb
    }
}
//Attach Public Route Table to pb subnet
resource "aws_route_table_association" "tf_lab_rtb_subnet" {
    count = length(aws_subnet.public_subnet)
    route_table_id = aws_route_table.tf_lab_pub_rtb.id
    subnet_id = aws_subnet.public_subnet[count.index].id
}

