resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

 resource "aws_instance" "app_server" {
   ami           = 
   instance_type = "ami-0fff1b9a61dec8a5f"

   tags = {
    Name = var.instance_name
   }
 }
