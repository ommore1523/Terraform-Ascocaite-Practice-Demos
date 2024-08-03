
/*

Quetion:
How well you create vpc in two regions simultaneously by using two profiles of aws itself

ANS:
provider "aws" {
  profile = "default"
  region = "ap-south-1"
  alias = "aws-ap-south-1-region"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
  alias = "aws-us-east-1-region"
}

resource "vpc" "my_vpc_apsouth"{
  provider = aws.aws-ap-south-1-region
  < vpc configuration here >
}


resource "vpc" "my_vpc_us-east"{
  provider = aws-us-east-1-region
  < vpc configuration here >
}

*/


provider "aws" {
  profile = "default"
  region = "ap-south-1"
}