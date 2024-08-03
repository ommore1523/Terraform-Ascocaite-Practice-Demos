module "aws_custom_s3_bucket" {
  source = "./module/s3_custom_module"
  bucket_name = var.my_bucket_name
  tags = var.my_tags
}