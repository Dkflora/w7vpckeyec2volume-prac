resource "aws_s3_bucket" "s3" {
  bucket = "w7buket1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}