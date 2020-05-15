##################### S3 #######################

resource "aws_s3_bucket" "aux_storage_01" {
  bucket = "aux-storage-01"
  acl    = "private"

  versioning {
    enabled    = false
    mfa_delete = false
  }
}

resource "aws_s3_bucket_object" "example_index" {
  bucket = aws_s3_bucket.aux_storage_01.bucket
  key    = "public/index.html"
  source = "etc/index.html"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  #etag = "${filemd5("path/to/file")}"
}
