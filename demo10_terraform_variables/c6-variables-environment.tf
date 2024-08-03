variable "tag_name" {
  type = string
  description = "ec2 instance ami"
  default = "ec2_defaut_name"
}

# export TF_VAR_tag_name="environemt read"