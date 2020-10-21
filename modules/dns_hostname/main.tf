resource "aws_route53_record" "default" {
  count   = var.enabled ? 1 : 0
  name    = var.name == "" ? "" : var.name
  zone_id = var.zone_id
  type    = var.type
  ttl     = var.ttl
  records = var.records
}