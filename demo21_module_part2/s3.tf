resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name
  tags = var.tags
  force_destroy=true
}

resource "aws_s3_bucket_website_configuration" "demo_web_conf" {
  bucket = aws_s3_bucket.demo_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "demo_web_permission" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_ownership_controls" "name" {
  bucket = aws_s3_bucket.demo_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "name" {
  bucket = aws_s3_bucket.demo_bucket.id
  policy = <<EOF
        {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Sid": "Statement1",
                  "Effect": "Allow",
                  "Principal": "*",
                  "Action": "s3:GetObject",
                  "Resource": "arn:aws:s3:::${var.bucket_name}/*"
              }
          ]
        }
        EOF
}

