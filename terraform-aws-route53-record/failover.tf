resource "aws_route53_record" "failover" {
  name    = var.dns_record
  zone_id = data.aws_route53_zone.zone.id

  type           = var.record_type
  ttl            = var.ttl
  records        = var.records
  set_identifier = var.set_identifier

  failover_routing_policy {
    type = var.failover_type
  }

  health_check_id = var.failover_health_check_id

  count = (
    (var.enable == true ? 1 : 0) *
    (var.record_routing_policy == "failover" ? 1 : 0) *
    (var.use_alias == "false" ? 1 : 0)
  )

  allow_overwrite = var.allow_overwrite

  provider = aws.dns
}

resource "aws_route53_record" "failover_alias" {
  name    = var.dns_record
  zone_id = data.aws_route53_zone.zone.id

  type           = var.record_type
  set_identifier = var.set_identifier

  alias {
    evaluate_target_health = var.alias_evaluate_target_health
    name                   = var.alias_dns_name
    zone_id                = var.alias_zone_id
  }

  failover_routing_policy {
    type = var.failover_type
  }

  count = (
    (var.enable == true ? 1 : 0) *
    (var.record_routing_policy == "failover" ? 1 : 0) *
    (var.use_alias == "true" ? 1 : 0)
  )

  allow_overwrite = var.allow_overwrite

  provider = aws.dns
}