data "aws_route53_zone" "zone" {
  name         = var.dns_zone
  private_zone = var.private_zone

  provider = aws.dns
}