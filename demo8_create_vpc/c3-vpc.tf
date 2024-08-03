

resource "aws_vpc" "om-vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "om-vpc"
  }
}

resource "aws_subnet" "om-subnet-pub" {
  vpc_id     = aws_vpc.om-vpc.id
  cidr_block = "10.0.0.0/26"

  tags = {
    Name = "om-subnet-pub"
  }
}




resource "aws_security_group" "om-pub-sg" {
  name        = "allow_ssh_icmp"
  description = "Allow SSH and ICMP traffic"
  vpc_id      = aws_vpc.om-vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere, restrict as needed
  }

  ingress {
    description = "Allow ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from anywhere, restrict as needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_icmp"
  }
}


resource "aws_instance" "om-ec2-pub" {
  ami                         = "ami-0ad21ae1d0696ad58"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.om-subnet-pub.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.om-pub-sg.id]
  key_name                    = "om-keypair"
  tags = {
    name = "om-ec2-pub"
  }
}


resource "aws_route_table" "om-pub-rt" {
  vpc_id = aws_vpc.om-vpc.id
}

resource "aws_route_table_association" "om-subnet-pub" {
  subnet_id      = aws_subnet.om-subnet-pub.id
  route_table_id = aws_route_table.om-pub-rt.id
}


resource "aws_internet_gateway" "om-igw" {
  vpc_id = aws_vpc.om-vpc.id
}

resource "aws_route" "om-rt-edit" {
  route_table_id         = aws_route_table.om-pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.om-igw.id
}
