variable "bucket_name" {
  description = "s3 bucket name "
  type = string
}

variable "tags" {
  description = "s3 bucket tags"
  type = map(string)
}

