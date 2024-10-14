resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "public-read" 

  website {
    index_document = "index.html"      # Documento principal do site
    error_document = "error.html"      # Documento de erro (opcional)
}
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.static_site.arn}/*"
    }]
  })
}
