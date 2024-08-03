/*
Functions:

terraform console:

    length("12")
    length([1,2,4])
    length({"a":2})

    substr("hello",1,2)

    file("shell_script.sh") # read file from local and us as tring content
*/

resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    user_data = file("shell_script.sh")
    tags = {
      Name = var.tagname 
    }
}