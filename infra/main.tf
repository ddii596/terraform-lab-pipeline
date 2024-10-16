resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "object" {
  bucket = var.bucket_name
  key    = "html.index"
  source = "/infra/index.html"


  
}
