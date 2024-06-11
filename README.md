# AWS WorkMail DNS Records

> This Terraform Module manages DNS records for AWS WorkMail.

## Table of Contents

<!-- TOC -->
* [AWS WorkMail DNS Records](#aws-workmail-dns-records)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* Amazon Web Services (AWS) [Account](https://aws.amazon.com/account/)
* Terraform `1.5.x` or newer.

## Usage

For examples, see the [./examples](https://github.com/ksatirli/terraform-aws-route53-workmail-records/tree/main/examples) directory.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| zone_id | ID of the DNS Zone to store Records in | `string` | n/a | yes |
| apex_txt_record_append | additional Domain Apex TXT Record data | `list(string)` | `[]` | no |
| dmarc_record | DMARC TXT Record | `string` | `"v=DMARC1;p=quarantine;pct=100;fo=1;"` | no |
| mail_from_subdomain | Subdomain to use as `MAIL FROM` domain. | `string` | `"mail"` | no |
| mx_priority | MX Priority | `string` | `10` | no |
| record_ttl | TTL for all DNS records | `string` | `86400` | no |
| spf_record | SPF TXT Record | `list(string)` | <pre>[<br>  "v=spf1 include:amazonses.com ~all;"<br>]</pre> | no |
| workmail_zone | AWS Zone of the WorkMail Organization | `string` | `"us-east-1"` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_route53_record_autodiscover | Exported Attributes for `aws_route53_record.autodiscover`. |
| aws_route53_record_dkim | Exported Attributes for `aws_route53_record.dkim`. |
| aws_route53_record_dmarc | Exported Attributes for `aws_route53_record.dmarc`. |
| aws_route53_record_mx | Exported Attributes for `aws_route53_record.mx`. |
| aws_route53_record_verification_token | Exported Attributes for `aws_route53_record.verification_token`. |
| aws_route53_record_zone_apex_txt | Exported Attributes for `aws_route53_record.zone_apex_txt`. |
| aws_ses_domain_dkim_main | Exported Attributes for `aws_ses_domain_dkim.main`. |
| aws_ses_domain_identity_main | Exported Attributes for `aws_ses_domain_identity.main`. |
<!-- END_TF_DOCS -->

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-aws-route53-workmail-records/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
