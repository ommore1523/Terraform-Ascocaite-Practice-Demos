
resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = var.typelist[0]
    tags = {
      Name = var.maptype["mapkey"]
    }
}