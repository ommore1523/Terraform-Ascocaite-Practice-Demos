variable "env" {
  type = string
  default = "dev"
}

variable "project" {
  type = string
  default = "lasso"
}


locals {
  deployment_name = "${var.env}-${var.env}"
}

# Quetions
# ANS

# variable "project" {
#   type = string
#   default = "lasso" <<-- Here we cannot use locals
# }


# In Terraform, the default value of a variable cannot reference other variables or 
# local values. This restriction exists because the default value must be a constant expression.