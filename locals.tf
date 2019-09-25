locals {
  mx_record            = "${var.mx_priority} inbound-smtp.${var.workmail_zone}.amazonaws.com."
  autodiscover_record  = "autodiscover.mail.${var.workmail_zone}.awsapps.com."
  zone_apex_txt_record = "${var.spf_record} ${var.apex_txt_record_append}"
  zone_name            = "${data.aws_route53_zone.zone.name}" // NOTE: trailing period is added by data source
}
