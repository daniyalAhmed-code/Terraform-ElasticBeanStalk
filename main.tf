module "vpc"{
    source = "./modules/vpc"
    NAME   = var.name
    VPC_CIDR = var.VPC_CIDR
    PUBLIC_SUBNET= var.PUBLIC_SUBNET
    PRIVATE_SUBNET= var.PRIVATE_SUBNET
    availability_zones   = var.availability_zones
    namespace            = var.namespace
    stage                = var.stage
    nat_gateway_enabled  = true
    nat_instance_enabled = false
}

module "elastic-beanstalk"{
    source = "./modules/elastic_beanstalk_application"
    name = var.name
    # version_label=var.version_label
    solution_stack_name = var.solution_stack_name
}
module "elastic-beanstalk-environment"{
    source = "./modules/elastic_beanstalk_application_environment"
    namespace                  = var.namespace
    stage                      = var.stage
    name                       = var.name
    attributes                 = [var.attributes]
    tags                       = var.tags
    delimiter                  = var.delimiter
    description                = var.description
    region                     = var.region
    availability_zone_selector = var.availability_zone_selector
    wait_for_ready_timeout             = var.wait_for_ready_timeout
    elastic_beanstalk_application_name = module.elastic-beanstalk.elastic_beanstalk_application_name
    environment_type                   = var.environment_type
    loadbalancer_type                  = var.loadbalancer_type
    elb_scheme                         = var.elb_scheme
    tier                               = var.tier
    version_label                      = var.version_label
    force_destroy                      = var.force_destroy
    instance_type    = var.instance_type
    root_volume_size = var.root_volume_size
    root_volume_type = var.root_volume_type
    autoscale_min             = var.autoscale_min
    autoscale_max             = var.autoscale_max
    autoscale_measure_name    = var.autoscale_measure_name
    autoscale_statistic       = var.autoscale_statistic
    autoscale_unit            = var.autoscale_unit
    autoscale_lower_bound     = var.autoscale_lower_bound
    autoscale_lower_increment = var.autoscale_lower_increment
    autoscale_upper_bound     = var.autoscale_upper_bound
    autoscale_upper_increment = var.autoscale_upper_increment
    vpc_id                  = module.vpc.vpc_id
    loadbalancer_subnets    = [module.vpc.public-subnets]
    application_subnets     = [module.vpc.public-subnets]
    rolling_update_enabled  = var.rolling_update_enabled
    rolling_update_type     = var.rolling_update_type
    updating_min_in_service = var.updating_min_in_service
    updating_max_batch      = var.updating_max_batch
    healthcheck_url  = var.healthcheck_url
    application_port = var.application_port
    solution_stack_name = var.solution_stack_name

    additional_settings = var.additional_settings
    
    extended_ec2_policy_document = data.aws_iam_policy_document.minimal_s3_permissions.json
    prefer_legacy_ssm_policy     = false
    }

data "aws_iam_policy_document" "minimal_s3_permissions" {
    statement {
        sid = "AllowS3OperationsOnElasticBeanstalkBuckets"
        actions = [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation"
        ]
        resources = ["*"]
        principals {
      type        = "minimal_s3_permissions"
      identifiers = ["*"]
    }
    }
    }

module "elastic-beanstalk-bucket"{
source = "./modules/elastic_beanstalk_bucket"
application = module.elastic-beanstalk.elastic_beanstalk_application_name
version_label = var.version_label
api_dist = var.api_dist
}