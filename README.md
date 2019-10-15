# Terraform Module: AWS WorkMail DNS Records

> This repository is a [Terraform](https://terraform.io/) Module for managing AWS Route 53 [DNS Records](https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html) for AWS WorkMail Organizations.

## Table of Contents

- [Terraform Module: AWS WorkMail DNS Records](#terraform-module-aws-workmail-dns-records)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [Module Variables](#module-variables)
    - [Module Outputs](#module-outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

This module requires Terraform version `0.12.0` or newer.

## Dependencies

This module depends on a correctly configured [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "workmail-records" {
  source           = "operatehappy/route53-workmail-records/aws"
  version          = "0.9.1"
  zone_id          = "Z3P5QSUBK4POTI"
  workmail_zone    = "us-west-1"
  ownership_record = "6S1lp9ffrgKqvqgv66W9XfrlprlLlquSU6gSVvrsx6Y="
  dkim_record_1    = "S9q64lvmxmg6qk66yqkweksSgpkrppwr"
  dkim_record_2    = "fSlyfoqsygmgSSrowS6ypsegd9qlrl3f"
  dkim_record_3    = "rslvrS696frfml6frufrSkfgSSfe3udu"
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/route53-workmail-records) using `terraform get`.

### Module Variables

Available variables are listed below, along with their default values:

| variable         | type   | description                                         | default                               |
|------------------|--------|-----------------------------------------------------|---------------------------------------|
| zone_id          | string | ID of the DNS Zone to store Records in              |                                       |
| record_ttl       | string | TTL for all DNS records                             | `300`                                 |
| workmail_zone    | string | AWS Zone of the WorkMail Organization               | `us-east-1` |                         |
| mx_priority      | string | MX Priority                                         | `10`                                  |
| ownership_record | string | Ownership TXT Record                                |                                       |
| dkim_record_1    | string | DKIM CNAME Record 1                                 |                                       |
| dkim_record_2    | string | DKIM CNAME Record 2                                 |                                       |
| dkim_record_3    | string | DKIM CNAME Record 3                                 |                                       |
| spf_record       | string | SPF TXT Record                                      | `v=spf1 include:amazonses.com ~all;`  |
| apex_txt_apped   | string | additional Zone Apex TXT Record data                |                                       |
| dmarc_record     | string | DMARC TXT Record                                    | `v=DMARC1;p=quarantine;pct=100;fo=1;` |

Additionally, the following variables are generated as [locals](https://www.terraform.io/docs/configuration/locals.html):

| key                 | value                                                                 |
|---------------------|-----------------------------------------------------------------------|
| mx_record           | `${var.mx_priority} inbound-smtp.${var.workmail_zone}.amazonaws.com.` |
| autodiscover_record | `autodiscover.mail.${var.workmail_zone}.awsapps.com.`                 |
| apex_txt_record     | `${var.spf_record} ${var.apex_txt_record_append}`                     |
| zone_name           | `${data.aws_route53_zone.name}`                                       |

### Module Outputs

Available outputs are listed below, along with their description

| output                | description                                                  |
|-----------------------|--------------------------------------------------------------|
| `ownership`           | interpolated value of `aws_route53_record.ownership.name`    |
| `mx`                  | interpolated value of `aws_route53_record.mx.name`           |
| `autodiscover`        | interpolated value of `aws_route53_record.autodiscover.name` |
| `dkim`                | interpolated value of `aws_route53_record.dkim-1.name`       |
| `dkim`                | interpolated value of `aws_route53_record.dkim-2.name`       |
| `dkim`                | interpolated value of `aws_route53_record.dkim-3.name`       |
| `spf`                 | interpolated value of `aws_route53_record.spf.name`          |
| `dmarc`               | interpolated value of `aws_route53_record.dmarc.name`        |
| `mx_record`           | interpolated value of `local.mx_record`                      |
| `autodiscover_record` | interpolated value of `local.autodiscover_record`            |
| `zone_name`           | interpolated value of `local.zone_name`                      |

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-aws-route53-workmail-records/graphs/contributors)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Copyright 2019 [Kerim Satirli](https://github.com/ksatirli)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
