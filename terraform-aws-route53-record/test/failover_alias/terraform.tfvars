region = "us-east-1"

record_routing_policy = "failover"

dns_zone   = "r53testzone.com"
dns_record = "failover-alias"

failover_type  = "PRIMARY"
set_identifier = "set_item_1"
use_alias      = "true"