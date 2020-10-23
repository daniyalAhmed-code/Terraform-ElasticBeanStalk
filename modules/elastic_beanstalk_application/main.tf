resource "aws_elastic_beanstalk_application" "default" {
    name        = var.name
    description = "Test elastic_beanstalk_application"
 
}
resource "aws_elastic_beanstalk_configuration_template" "tf_template" {
  name                = var.name
  application         = aws_elastic_beanstalk_application.default.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.16.0 running Docker 19.03.6-ce"
}
