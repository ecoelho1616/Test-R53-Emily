variable "region" {
  type = string
}

variable "record_routing_policy" {
  type = string
}

variable "dns_zone" {
  type = string
}
variable "dns_record" {
  type = string
}

variable "records" {
  type = list
}

variable "weighted_weight" {
  type = string
}
variable "set_identifier" {
  type = string
}