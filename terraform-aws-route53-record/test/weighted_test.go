package test

import (
	"testing"
	"fmt"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/aws/aws-sdk-go/service/route53"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/aws"
)

func TestTerraformWeighted(t *testing.T) {
    terraformOptions := &terraform.Options{
		TerraformDir: "weighted",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	dns_zone_id := terraform.Output(t, terraformOptions, "dns_zone_id")
	record_fqdn := terraform.Output(t, terraformOptions, "record_fqdn")
	record_fqdn += "."

	var records []string

    svc := route53.New(session.New(&aws.Config{
        Region: aws.String("us-east-1"),
    }))

    input := &route53.ListResourceRecordSetsInput{
        HostedZoneId: aws.String(dns_zone_id),
    }
    err := svc.ListResourceRecordSetsPages(input,
        func(page *route53.ListResourceRecordSetsOutput, lastPage bool) bool {
            for _, v := range page.ResourceRecordSets {
                records = append(records, aws.StringValue(v.Name))
            }
            return lastPage
        },
    )
    if err != nil {
        fmt.Println(err.Error())
        return
    }

    assert.Contains(t, records, record_fqdn)
}