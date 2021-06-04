# terraform-aws-route53-record

This module is able to create a route53 record in one of 4 different types 
with two different modes each:

Types:

- standalone: A single record within a zone
- failover: A record supporting a primary/secondary failover
- latency: A record that would be part of a set that routes to the lowest 
latency endpoint based on your internet connection
- weighted: A record that would be part of a set that routes to different 
endpoints based on set weights

Modes:

- records: A set of individual records within a zone entry (IP's or names)
- alias: A record within a zone pointing to another AWS resource

## terraform 0.12
This module has been updated to support terraform 0.12.  The last version to support 0.11 is 2019.7.22.1-4

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| region | Which AWS Region to deploy into | string | `None` | yes |
| enable | If this module should create records or not | bool | `true` | no |
| dns_zone | The route53 zone to create entries in | string | `None` | yes |
| dns_record | The entry to make in route53 | string | `None` | yes |
| record_routing_policy | The routing_policy to be used with this record.  Supports standalone, failover, latency, and weighted | string | `standalone` | no |
| set_identifier | Unique identifier to differentiate records when using any routing other than standard | string | `Empty` | no |
| record_type | The type of record to create. One of A, AAAA, CAA, MX, NAPTR, NS, PTR, SOA, SPF, SRV, TXT. | string | `A` | no |
| records | The records to add to the dns entry. Cannot be used in combination with alias | list | [] | no |
| use_alias | If we should use the alias creation instead of records creation | boolean | `false` | no |
| alias_dns_name | The dns name alias to apply to the record | string | `skip` | no |
| alias_zone_id | The zone_id to apply to the record | string | `skip` | no |
| alias_evaluate_target_health | Should the health of the target be monitored when using an alias | boolean | `true` | no |
| ttl | The record ttl | int | `300` | no |
| failover_type | The type of failover record this is.  Must be either PRIMARY or SECONDARY | string | `PRIMARY` | no |
| failover_health_check_id | The health check ID to use for failover validation | string | `Empty` | no |
| weighted_weight | The weight of a record for a weighted routing policy | int | `100` | no |
| allow_overwrite | If we should allow overwrite of existing records | bool | `false` | no |
| private_zone | The private or public hosted zone | bool | `false` | no |

## AWS Providers
| Name | Description |
|------|-------------|
| aws.dns | The provider for the account/region that relevant route53 zone is in |

## Outputs
| Name | Description |
|------|-------------|
| record_name | The name of the record that was created |
| record_fqdn | The FQDN of the record that was created |
| dns_zone | The name of the DNS zone to create the record in |
| dns_zone_id | The ID of the DNS zone to create the record in |
