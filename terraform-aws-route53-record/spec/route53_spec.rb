require 'spec_helper'

dns_zones = ENV['dns_zone_id'].split(",")
record_fqdns = ENV['record_fqdn'].split(",")

dns_zones.zip(record_fqdns).each do |dns_zone, record_fqdn|
    describe route53_hosted_zone(dns_zone) do
        it { should have_record_set(record_fqdn + ".") }
    end
end
