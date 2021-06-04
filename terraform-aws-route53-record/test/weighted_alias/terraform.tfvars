region = "us-east-1"

record_routing_policy = "weighted"

dns_zone   = "r53testzone.com"
dns_record = "weighted-alias"

weighted_weight = "100"
set_identifier  = "set_item_1"
use_alias       = "true"