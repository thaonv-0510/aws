resource "aws_s3_bucket" "bucket-role" {
  bucket = "bucket-role"

  tags = {
    Name        = "bucket-role-1"
    Environment = "dev"
  }
}
