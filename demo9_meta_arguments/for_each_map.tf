variable "instance_tags1" {
  type = map(string)
  default = {
    "dev":"dev_ec2",
    "prod":"prod_ec2"
  }
}


resource "aws_instance" "example1" {
  for_each = var.instance_tags1
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    "${each.key}" = var.instance_tags1[each.value]
  }
}