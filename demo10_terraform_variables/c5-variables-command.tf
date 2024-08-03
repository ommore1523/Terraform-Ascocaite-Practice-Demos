variable "tag_name3" {
  type = string
  description = "ec2 instance ami"
  default = "ec2_defaut_name"
}

# terraform plan -var tag_name="overrided"