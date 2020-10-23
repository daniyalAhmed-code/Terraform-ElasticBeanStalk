data "archive_file" "api_dist_zip" {
  type        = "zip"
  source_dir = "${path.module}/${var.api_dist}/"
  output_path = "${path.module}/application/${var.api_dist}.zip"
}
resource "aws_s3_bucket" "dist_bucket" {
  bucket = "${terraform.workspace}-elb-dist"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "dist_item" {
  bucket =aws_s3_bucket.dist_bucket.id
  key    = "application/${var.api_dist}.zip"
  source = "${path.module}/application/${var.api_dist}.zip"
  etag = filemd5("${path.module}/application/${var.api_dist}.zip")
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        =  "daniyal-docker-001"
  application = "${var.application}" 
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.dist_bucket.bucket}"
  key         = "${aws_s3_bucket_object.dist_item.id}"
}

