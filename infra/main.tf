resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

 resource "aws_instance" "app_server" {
   ami           = "ami-0fff1b9a61dec8a5f"
   instance_type = "t2.micro"
   tags = {
    Name = var.instance_name
   }
 }
