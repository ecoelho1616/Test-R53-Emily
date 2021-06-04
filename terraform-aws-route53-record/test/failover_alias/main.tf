resource "aws_route53_zone" "zone" {
  name = var.dns_zone
}

resource "aws_elb" "elb" {
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }
  availability_zones = ["us-east-1b"]
}

module "record" {
  source = "../.."

  region = var.region

  record_routing_policy = var.record_routing_policy

  dns_zone   = aws_route53_zone.zone.name
  dns_record = var.dns_record

  alias_dns_name = aws_elb.elb.dns_name
  alias_zone_id  = aws_elb.elb.zone_id

  failover_type  = var.failover_type
  set_identifier = var.set_identifier
  use_alias      = var.use_alias

  providers = {
    aws.dns = aws
  }
}