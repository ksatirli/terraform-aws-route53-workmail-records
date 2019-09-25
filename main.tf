// verify Domain ownership
resource "aws_route53_record" "ownership" {
  zone_id = var.zone_id
  name    = "_amazonses.${local.zone_name}"
  type    = "TXT"
  ttl     = var.record_ttl
  records = [var.ownership_record]
}

resource "aws_route53_record" "mx" {
  zone_id = var.zone_id
  name    = local.zone_name
  type    = "MX"
  ttl     = var.record_ttl
  records = [local.mx_record]
}

// enable Autodiscover service for Outlook and other clients
resource "aws_route53_record" "autodiscover" {
  zone_id = var.zone_id
  name    = "autodiscover.${local.zone_name}"
  type    = "CNAME"
  ttl     = var.record_ttl
  records = [local.autodiscover_record]
}

// DKIM, SPF, and DMARC records
resource "aws_route53_record" "dkim-1" {
  zone_id = var.zone_id
  name    = "${var.dkim_record_1}.${local.zone_name}"
  type    = "CNAME"
  ttl     = var.record_ttl
  records = ["${var.dkim_record_1}._domainkey.${local.zone_name}"]
}

resource "aws_route53_record" "dkim-2" {
  zone_id = var.zone_id
  name    = "${var.dkim_record_2}.${local.zone_name}"
  type    = "CNAME"
  ttl     = var.record_ttl
  records = ["${var.dkim_record_2}._domainkey.${local.zone_name}"]
}

resource "aws_route53_record" "dkim-3" {
  zone_id = var.zone_id
  name    = "${var.dkim_record_3}.${local.zone_name}"
  type    = "CNAME"
  ttl     = var.record_ttl
  records = ["${var.dkim_record_3}._domainkey.${local.zone_name}"]
}

resource "aws_route53_record" "zone-apex-txt" {
  zone_id = var.zone_id
  name    = local.zone_name
  type    = "TXT"
  ttl     = var.record_ttl
  records = [local.zone_apex_txt_record]
}

resource "aws_route53_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${local.zone_name}"
  type    = "TXT"
  ttl     = var.record_ttl
  records = [var.dmarc_record]
}
