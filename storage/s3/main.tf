resource "aws_s3_bucket" "example" {
  bucket = "new-test-bucket-123456789987654345676567543"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
