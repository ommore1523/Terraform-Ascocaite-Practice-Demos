/*

### this terraform block called in 3 ways:
1. Terraform block
2. Setting block
3. Configuration Block

NOTES:
1. Only constant values are allowed
2. Arguments, resources , variables or build in functions cannot be used


Quetions:
1. What is terraform block ? What kind of information does it saves?
2. Can we use varaibles in terraform block ?
3. what is backend ?
4. Which version do you use of tf and provider => 0.14, 3.21


(REF: https://github.com/stacksimplify/hashicorp-certified-terraform-associate/tree/main/03-Terraform-Fundamental-Blocks/03-01-Terraform-Block)

*/

terraform {
  required_version = "~> 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }
  
#   backend "s3" {
#     bucket = "value"
#     key = "value"
#     region = "value"
#   }
}
