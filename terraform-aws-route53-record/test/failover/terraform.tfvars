region = "us-east-1"

record_routing_policy = "failover"

dns_zone   = "r53testzone.com"
dns_record = "failover"

records = ["1.2.3.4"]

failover_type  = "SECONDARY"
set_identifier = "set_item_1"