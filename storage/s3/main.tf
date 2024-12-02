resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-007"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
