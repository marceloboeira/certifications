##################### S3 #######################

resource "aws_s3_bucket" "aux_storage_01" {
  bucket = "aux-storage-01"
  acl = "private"

  versioning {
    enabled    = false
    mfa_delete = false
  }
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.aux_storage_01.bucket
  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicFolderReadAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.aux_storage_01.arn}/public/*"
    }
  ]
}
EOF
}

# Encryption Key
resource "aws_kms_key" "s3_key" {
  description             = "Sample Key Test"
  deletion_window_in_days = 7
}

# Public File
resource "aws_s3_bucket_object" "example_public" {
  bucket       = aws_s3_bucket.aux_storage_01.bucket
  key          = "public/index.html"
  source       = "etc/index.html"
  content_type = "text/html"
}

# Forbidden File
resource "aws_s3_bucket_object" "example_forbidden" {
  bucket       = aws_s3_bucket.aux_storage_01.bucket
  key          = "private/forbidden.html"
  source       = "etc/forbidden.html"
  content_type = "text/html"
  kms_key_id = aws_kms_key.s3_key.arn
}
