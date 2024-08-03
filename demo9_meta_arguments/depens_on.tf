resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "web-server"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.web.id
  depends_on = [aws_instance.web]
}
