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

This module requires Terraform version `0.12.x` or newer.

## Dependencies

This module depends on a correctly configured [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "workmail-dns-records-example-com" {
  source = "../terraform-module-aws-route53-workmail-records"
  //source           = "github.com/operatehappy/terraform-module-github-aws-route53-workmail-records?ref=0.9.0"
  //version          = "0.9.0"
  zone_id          = "ZSEXFGJ99OGTP"
  workmail_zone    = "us-west-1"
  ownership_record = "6S1lp9ffrgKqvqgv66W9XfrlprlLlquSU6gSVvrsx6Y="
  dkim_record_1    = "S9q64lvmxmg6qk66yqkweksSgpkrppwr"
  dkim_record_2    = "fSlyfoqsygmgSSrowS6ypsegd9qlrl3f"
  dkim_record_3    = "rslvrS696frfml6frufrSkfgSSfe3udu"
}
```

Then, load the module using `terraform get`.

### Module Variables

Available variables are listed below, along with their default values:

| variable         | type   | description                                         | default                              |
|------------------|--------|-----------------------------------------------------|--------------------------------------|
| zone_id          | string | ID of the DNS Zone to store Records in              |                                      |
| record_ttl       | string | TTL for all DNS records                             | `300`                                |
| workmail_zone    | string | AWS Zone of the WorkMail Organization               | `us-east-1` |                        |
| mx_priority      | string | MX Priority                                         | `10`                                 |
| ownership_record | string | Ownership TXT Record                                |                                      |
| dkim_record_1    | string | DKIM CNAME Record 1                                 |                                      |
| dkim_record_2    | string | DKIM CNAME Record 2                                 |                                      |
| dkim_record_3    | string | DKIM CNAME Record 3                                 |                                      |
| spf_record       | string | SPF TXT Record                                      | `v=spf1 include:amazonses.com ~all`  |
| dmarc_record     | string | DMARC TXT Record                                    | `v=DMARC1;p=quarantine;pct=100;fo=1` |

Additionally, the following variables are generated as [locals](https://www.terraform.io/docs/configuration/locals.html):

| key                 | value                                                                 |
|---------------------|-----------------------------------------------------------------------|
| mx_record           | `${var.mx_priority} inbound-smtp.${var.workmail_zone}.amazonaws.com.` |
| autodiscover_record | `autodiscover.mail.${var.workmail_zone}.awsapps.com.`                 |
| zone_name           | `${data.aws_route53_zone.name}.`                                      |

### Module Outputs

Available outputs are listed below, along with their description

| output            | description                                                                                                         |
|-------------------|---------------------------------------------------------------------------------------------------------------------|
| `full_name`       | A string of the form `orgname/reponame`.                                                                            |
| `ssh_clone_url`   | URL that can be provided to `git clone` to clone the repository via SSH.                                            |
| `http_clone_url`  | URL that can be provided to `git clone` to clone the repository via HTTPS.                                          |
| `git_clone_url`   | URL that can be provided to git clone to clone the repository anonymously via the git protocol.                     |
| `svn_url`         | URL that can be provided to `svn checkout` to check out the repository via GitHub's Subversion protocol emulation.  |

## Author Information

This module is currently maintained by the individuals listed below.

- [Kerim Satirli](https://github.com/ksatirli)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Copyright 2019 [Kerim Satirli](https://github.com/ksatirli)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
