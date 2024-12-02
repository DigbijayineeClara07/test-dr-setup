resource "aws_s3_bucket" "example" {
  bucket = "new-test-bucket-34567890987654321234567890y"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
