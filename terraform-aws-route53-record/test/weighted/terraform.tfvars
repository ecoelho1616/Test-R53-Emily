region = "us-east-1"

record_routing_policy = "weighted"

dns_zone   = "r53testzone.com"
dns_record = "weighted"

records = ["1.2.3.4"]

weighted_weight = "100"
set_identifier  = "set_item_1"