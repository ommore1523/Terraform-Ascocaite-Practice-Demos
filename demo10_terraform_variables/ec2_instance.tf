/*

Quetions:
    1. Can Provider block user variables ?  [Yes, terraform cannot use]
    2. Can you apply using plan.out file ? what are the benefits [command vars ]
    3. What is variables precedence ? [env < .tfvars < auto.tfvars <-var cmd < -var-file ]
    4. what is diff between .tfvars and .auto.tfvars ?

*/


resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    tags = {
      Name = var.tag_name
    }
}