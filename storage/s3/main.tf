resource "aws_s3_bucket" "example" {
  bucket = "new-test-bucket-${random_string.suffix.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
