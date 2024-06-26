variable "apex_txt_record_append" {
  type        = list(string)
  description = "additional Domain Apex TXT Record data"
  default     = []
}

variable "dmarc_record" {
  type        = string
  description = "DMARC TXT Record"
  default     = "v=DMARC1;p=quarantine;pct=100;fo=1;"
}

variable "mail_from_subdomain" {
  type        = string
  description = "Subdomain to use as `MAIL FROM` domain."
  default     = "mail"
}

variable "mx_priority" {
  type        = string
  description = "MX Priority"
  default     = 10
}

variable "record_ttl" {
  type        = string
  description = "TTL for all DNS records"
  default     = 86400
}

variable "spf_record" {
  type        = list(string)
  description = "SPF TXT Record"
  default     = ["v=spf1 include:amazonses.com ~all;"]
}

variable "workmail_zone" {
  type        = string
  description = "AWS Zone of the WorkMail Organization"
  default     = "us-east-1"
}

variable "zone_id" {
  type        = string
  description = "ID of the DNS Zone to store Records in"
}
