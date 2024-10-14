resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = false  # Desativa o bloqueio de ACLs públicas
  block_public_policy     = false  # Desativa o bloqueio de políticas públicas
  ignore_public_acls      = false  # Permite ACLs públicas
  restrict_public_buckets = false  # Permite políticas públicas no bucket
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "Static Website Bucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket.arn}/index.html"  # Permitir acesso apenas ao index.html
      },
      {
        Effect = "Deny"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket.arn}/*"
        Condition = {
          StringNotEquals = {
            "s3:prefix" = "index.html"
          }
        }
      }
    ]
  })
}
