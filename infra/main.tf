resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "object" {
  bucket = var.bucket_name
  key    = "html.index"
  source = "/home/runner/work/terraform-lab-pipeline/terraform-lab-pipeline/infra/html.index"


  
}



# Configuração do website no bucket
resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  
}

# Desativar bloqueio de políticas públicas no bucket (opcional, se o bucket precisar ser acessível publicamente)
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Política do bucket para permitir acesso público (se necessário)
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.bucket.arn}/*"
    }]
  })
}

# Política do bucket para permitir acesso público (se necessário)
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.bucket.arn}/*"
    }]
  })
}
