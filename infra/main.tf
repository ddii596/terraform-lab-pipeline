resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "object" {
  bucket = var.bucket_name
  key    = "html.index"
  source = "/home/runner/work/terraform-lab-pipeline/terraform-lab-pipeline/infra/html.index"
  acl = "public-read"


  
}
