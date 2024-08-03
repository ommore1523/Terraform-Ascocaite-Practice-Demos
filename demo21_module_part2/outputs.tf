output "bucket_id" {
  description = "aws bucket ID : "
  value = aws_s3_bucket.demo_bucket.id
}

output "bucket_region" {
  description = "aws bucket REGION : "
  value = aws_s3_bucket.demo_bucket.region
}

output "WebsiteEndPoint" {
  description = "Aws bucket Web ENDPOINT : "
  value = aws_s3_bucket_website_configuration.demo_web_conf.website_endpoint
}