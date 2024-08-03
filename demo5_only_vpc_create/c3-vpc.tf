/*

NOTE: Terraform Dependency Lock:
   Terraform configuration refers to two different kinds of external dependencies that comes from outside of its own codebase
   ie. providers and modules 

Quetion:
What is terraform.lock.hcl file does ?
   - For provider we are using tild sybol to download and use nearly version it it for run our terraform. HCL file locks the exact version
   of provider so that when we work in future with terraform same version will be downloaed and used. IF tf not found lock file then
   it will use latest version as per required_providers block
   IMP: its only supporting for provider version. FOr module use exact version if possible
   
*/


resource "aws_vpc" "demo-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc-tf"
  }
}