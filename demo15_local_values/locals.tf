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