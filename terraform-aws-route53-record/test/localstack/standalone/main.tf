resource "aws_route53_zone" "zone" {
  name = var.dns_zone
}

module "record" {
  source = "../../../"

  region = var.region

  record_routing_policy = var.record_routing_policy

  dns_zone   = aws_route53_zone.zone.name
  dns_record = var.dns_record

  records = var.records
  enable  = false

  providers = {
    aws.dns = aws
  }
}
