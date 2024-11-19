provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.kops_bucket_name

  # Tags
  tags = var.tags
}


