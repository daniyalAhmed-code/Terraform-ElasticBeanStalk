variable "VPC_CIDR"{}
variable "region"{}
variable "PUBLIC_SUBNET"{}
variable "PRIVATE_SUBNET"{}
variable "name"{}
variable "namespace"{}
variable "stage"{}

variable "availability_zones"{}

variable "description"{}
variable "tier"{}
variable "environment_type"{}
variable "loadbalancer_type"{}
variable "availability_zone_selector"{}
variable "instance_type"{}
variable "autoscale_min"{}
variable "autoscale_max"{}
variable "wait_for_ready_timeout"{}
variable "force_destroy"{}
variable "rolling_update_enabled"{}
variable "attributes"{}
variable "rolling_update_type"{}
variable "tags"{}
variable "updating_min_in_service"{}
variable "delimiter"{}
variable "updating_max_batch"{}
variable "healthcheck_url" {}
variable "application_port" {}
variable "root_volume_size"{}
variable "root_volume_type"{}
variable "autoscale_measure_name"{}
variable "autoscale_statistic" {}
variable "autoscale_unit"{}
variable "autoscale_lower_bound"{}
variable "autoscale_lower_increment"{}
variable "autoscale_upper_bound"{}
variable "autoscale_upper_increment"{}
variable "elb_scheme" {}
variable "solution_stack_name"{}
variable "version_label" {}
variable "dns_zone_id" {}
variable  "additional_settings"{}
variable  "dns_subdomain"{}