
/*
Quetions:
 1. What is terraform state ?
    Tiny database for terraform which keep track of resource in infrastrucre. It tracks provisioned resources

 2. What are the different kind of resource behaviour ? Explain with an example.
    Types  1. Create 2. Destroy 3. Update in place 4. Destroy and recreate
    Example :  Ec2 instance a. If not present then create (symbol [+])
               Ec2 Instance b. If Present The destroy (-)
               Ec2 instance d. If ami changes then destroy and recreated    (-/+)

    It will look into tfstate file for resource state 

 3. What is desired and current state ?
    State which present tfstate is current state and whichever modification you are doing inside tf files.
*/

resource "aws_instance" "demo1_ec2_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    tags = {
      Name = "ec2_tf_demo1"
    }
}