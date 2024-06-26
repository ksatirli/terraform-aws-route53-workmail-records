# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone
data "aws_route53_zone" "zone" {
  zone_id = var.zone_id
}

locals {
  autodiscover_record  = "autodiscover.mail.${var.workmail_zone}.awsapps.com."
  mx_record            = "${var.mx_priority} inbound-smtp.${var.workmail_zone}.amazonaws.com."
  zone_apex_txt_record = concat(var.spf_record, var.apex_txt_record_append)
  zone_name            = data.aws_route53_zone.zone.name // NOTE: trailing period is added by data source
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "mx" {
  zone_id = var.zone_id
  name    = local.zone_name
  type    = "MX"
  ttl     = var.record_ttl

  records = [
    local.mx_record
  ]
}

# enable autodiscovery service for Outlook and other clients
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "autodiscover" {
  zone_id = var.zone_id
  name    = "autodiscover.${local.zone_name}"
  type    = "CNAME"
  ttl     = var.record_ttl

  records = [
    local.autodiscover_record
  ]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity
resource "aws_ses_domain_identity" "main" {
  domain = local.zone_name
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from
resource "aws_ses_domain_mail_from" "main" {
  domain           = aws_ses_domain_identity.main.domain
  mail_from_domain = "${var.mail_from_subdomain}.${aws_ses_domain_identity.main.domain}"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "verification_token" {
  zone_id = var.zone_id
  name    = "_amazonses.${local.zone_name}"
  type    = "TXT"
  ttl     = "600"

  records = [
    aws_ses_domain_identity.main.verification_token
  ]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim
resource "aws_ses_domain_dkim" "main" {
  domain = aws_ses_domain_identity.main.domain
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "dkim" {
  count   = 3
  zone_id = var.zone_id
  name    = "${element(aws_ses_domain_dkim.main.dkim_tokens, count.index)}._domainkey.${local.zone_name}"
  type    = "CNAME"
  ttl     = "600"

  records = [
    "${element(aws_ses_domain_dkim.main.dkim_tokens, count.index)}.dkim.amazonses.com."
  ]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "zone_apex_txt" {
  zone_id = var.zone_id
  name    = local.zone_name
  type    = "TXT"
  ttl     = var.record_ttl
  records = local.zone_apex_txt_record
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${local.zone_name}"
  type    = "TXT"
  ttl     = var.record_ttl
  records = [
    var.dmarc_record
  ]
}
