/*

Quetions:


*/


resource "aws_instance" "demo1_ec2_instance" {
  ami                         = "ami-0ad21ae1d0696ad58"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "ec2_tf_demo1"
  }
}