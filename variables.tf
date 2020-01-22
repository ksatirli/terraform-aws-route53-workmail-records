variable "zone_id" {
  type        = string
  description = "ID of the DNS Zone to store Records in"
}

variable "record_ttl" {
  type        = string
  description = "TTL for all DNS records"
  default     = 86400
}

variable "workmail_zone" {
  type        = string
  description = "AWS Zone of the WorkMail Organization"
  default     = "us-east-1"
}

variable "mx_priority" {
  type        = string
  description = "MX Priority"
  default     = 10
}

variable "ownership_record" {
  type        = string
  description = "Ownership TXT Record"
}

variable "dkim_record_1" {
  type        = string
  description = "DKIM CNAME Record 1"
}

variable "dkim_record_2" {
  type        = string
  description = "DKIM CNAME Record 2"
}

variable "dkim_record_3" {
  type        = string
  description = "DKIM CNAME Record 3"
}

variable "spf_record" {
  type        = string
  description = "SPF TXT Record"
  default     = "v=spf1 include:amazonses.com ~all;"
}

variable "apex_txt_record_append" {
  type        = string
  description = "additional Domain Apex TXT Record data"
  default     = ""
}

variable "dmarc_record" {
  type        = string
  description = "DMARC TXT Record"
  default     = "v=DMARC1;p=quarantine;pct=100;fo=1;"
}

data "aws_route53_zone" "zone" {
  zone_id = var.zone_id
}
