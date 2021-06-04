/* Which AWS Region to deploy into */
variable "region" {
  type = string
}

variable "enable" {
  type        = bool
  default     = true
  description = "If this module should create records or not"
}

variable "dns_zone" {
  type        = string
  description = "The route53 zone to create entries in"
}
variable "dns_record" {
  type        = string
  description = "The entry to make in route53"
}

variable "record_routing_policy" {
  type        = string
  description = "The routing_policy to be used with this record.  Supports standalone, failover, latency, and weighted"
  default     = "standalone"
}
variable "set_identifier" {
  type        = string
  description = "Unique identifier to differentiate records when using any routing other than standard"
  default     = ""
}

variable "record_type" {
  type        = string
  description = "The type of record to create. One of A, AAAA, CAA, MX, NAPTR, NS, PTR, SOA, SPF, SRV, TXT."
  default     = "A"
}
variable "records" {
  type        = list(any)
  description = "The records to add to the dns entry. Cannot be used in combination with alias"
  default     = []
}

variable "use_alias" {
  type        = string
  description = "If we should use the alias creation instead of records creation"
  default     = "false"
}
variable "alias_dns_name" {
  type        = string
  description = "The dns name alias to apply to the record"
  default     = "skip"
}
variable "alias_zone_id" {
  type        = string
  description = "The zone_id to apply to the record"
  default     = "skip"
}
variable "alias_evaluate_target_health" {
  type        = string
  description = "Should the health of the target be monitored when using an alias"
  default     = "true"
}

variable "ttl" {
  type        = string
  description = "The record ttl"
  default     = "300"
}

variable "failover_type" {
  type        = string
  description = "The type of failover record this is.  Must be either PRIMARY or SECONDARY"
  default     = "PRIMARY"
}
variable "failover_health_check_id" {
  type        = string
  description = "The health check ID to use for failover validation"
  default     = ""
}

variable "weighted_weight" {
  type        = string
  description = "The weight of a record for a weighted routing policy"
  default     = "100"
}

variable "allow_overwrite" {
  type        = bool
  description = "If we should allow overwrite of existing records"
  default     = false
}

variable "private_zone" {
  type        = bool
  description = "The private or public hosted zone"
  default     = false
}
