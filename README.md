# Terraform Module: AWS WorkMail DNS Records

> Terraform Module for managing AWS Route 53 [DNS Records](https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html) for AWS WorkMail Organizations.

## Table of Contents

- [Terraform Module: AWS WorkMail DNS Records](#terraform-module-aws-workmail-dns-records)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.12.0` or newer.

## Dependencies

This module depends on a correctly configured [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "workmail_records" {
  source           = "operatehappy/route53-workmail-records/aws"
  version          = "1.0.0"
  zone_id          = "Z3P5QSUBK4POTI"
  workmail_zone    = "us-west-2"
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/route53-workmail-records) using `terraform get`.

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| zone_id | ID of the DNS Zone to store Records in | `string` | n/a |
| apex_txt_record_append | additional Domain Apex TXT Record data | `list(string)` | `[]` |
| dmarc_record | DMARC TXT Record | `string` | `"v=DMARC1;p=quarantine;pct=100;fo=1;"` |
| mx_priority | MX Priority | `string` | `10` |
| record_ttl | TTL for all DNS records | `string` | `86400` |
| spf_record | SPF TXT Record | `string` | `"v=spf1 include:amazonses.com ~all;"` |
| workmail_zone | AWS Zone of the WorkMail Organization | `string` | `"us-east-1"` |

### Outputs

| Name | Description |
|------|-------------|
| autodiscover | interpolated value of `aws_route53_record.autodiscover.name` |
| autodiscover_record | interpolated value of `local.autodiscover_record` |
| dkim | interpolated value of `aws_ses_domain_dkim.dkim.dkim_tokens` |
| dmarc | interpolated value of `aws_route53_record.dmarc.name` |
| mx | interpolated value of `aws_route53_record.mx.name` |
| mx_record | interpolated value of `local.mx_record` |
| zone_apex_txt_record | interpolated value of `aws_route53_record.zone-apex-txt.name` |
| zone_name | interpolated value of `local.zone_name` |
| domain_identity_arn | interpolated value of `aws_ses_domain_identity.identity.arn` |
| domain_identity_verification_token | interpolated value of `aws_ses_domain_identity.identity.verification_token` |

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-aws-route53-workmail-records/graphs/contributors).

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
