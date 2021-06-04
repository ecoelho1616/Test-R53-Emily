output "record_name" {
  value = (element(concat(
    aws_route53_record.standalone.*.name,
    aws_route53_record.standalone_alias.*.name,
    aws_route53_record.failover.*.name,
    aws_route53_record.failover_alias.*.name,
    aws_route53_record.latency.*.name,
    aws_route53_record.latency_alias.*.name,
    aws_route53_record.weighted.*.name,
    aws_route53_record.weighted_alias.*.name,
    tolist("")
  ), 0))
}

output "record_fqdn" {
  value = (element(concat(
    aws_route53_record.standalone.*.fqdn,
    aws_route53_record.standalone_alias.*.fqdn,
    aws_route53_record.failover.*.fqdn,
    aws_route53_record.failover_alias.*.fqdn,
    aws_route53_record.latency.*.fqdn,
    aws_route53_record.latency_alias.*.fqdn,
    aws_route53_record.weighted.*.fqdn,
    aws_route53_record.weighted_alias.*.fqdn,
    tolist("")
  ), 0))
}

output "dns_zone" {
  value = var.dns_zone
}
output "dns_zone_id" {
  value = data.aws_route53_zone.zone.id
}