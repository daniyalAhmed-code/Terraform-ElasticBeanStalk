data "archive_file" "api_dist_zip" {
  type        = "zip"
  source_dir =  "${path.module}/application/${var.api_dist}/"
  output_path = "${path.module}/application/zip/${var.api_dist}.zip"
}
resource "aws_s3_bucket" "dist_bucket" {
  bucket = "daniyal-elb-dist"
  acl    = "private"
}
resource "aws_s3_bucket_object" "dist_item" {
  key    = "daniyal-elb/dist-${uuid()}"
  bucket = "${aws_s3_bucket.dist_bucket.id}"
  source = "${path.root}/application/zip/${var.api_dist}.zip"
}
resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "daniyal-bucket-${uuid()}"
#   application = "${module.elastic_beanstalk_application.app_name}"
  application = "${var.application}" 
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.dist_bucket.id}"
  key         = "${aws_s3_bucket_object.dist_item.id}"
}