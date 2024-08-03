variable "my_bucket_name" {
  description = "s3 bucket name "
  type = string
}

variable "my_tags" {
  description = "s3 bucket tags"
  type = map(string)
}

