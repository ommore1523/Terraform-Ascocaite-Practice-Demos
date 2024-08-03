data "aws_ami" "ec2_ami" {
  most_recent      = true

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_instance" "demo1_ec2_instance" {
    ami = data.aws_ami.ec2_ami.id
    instance_type = "t2.micro"
    tags = {
      Name = "ec2_tf_demo1"
    }
}

output "ec2_ami" {
  description = "aws ami"
  value = data.aws_ami.ec2_ami
}