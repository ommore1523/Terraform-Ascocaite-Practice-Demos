resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = false
    prevent_destroy = false
    ignore_changes = [  ]
    replace_triggered_by = [  ]
  }
}