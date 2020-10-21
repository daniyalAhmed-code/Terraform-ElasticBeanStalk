variable "ttl"{
    default = 300
}
variable "enabled"{}
variable "zone_id"{}
variable "type" {
  type        = string
  default     = "CNAME"
  description = "Type of DNS records to create"
}
variable "records"{}
variable "name"{}
