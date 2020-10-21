resource "aws_elastic_beanstalk_application" "default" {
    name        = var.name
    description = "Test elastic_beanstalk_application"
}
