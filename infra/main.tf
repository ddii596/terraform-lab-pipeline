resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"      # Documento principal do site
    error_document = "error.html"      # Documento de erro (opcional)
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id  # Correção no nome do recurso "bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.bucket.arn}/*"  # Correção no nome do recurso "bucket"
    }]
  })
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
