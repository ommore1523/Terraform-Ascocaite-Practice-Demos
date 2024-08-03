variable "instance_tags2" {
  type = set(string)
  default = ["dev","prod"]
}


resource "aws_instance" "example2" {
  for_each = var.instance_tags2
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    "Name" = each.key
  }
}