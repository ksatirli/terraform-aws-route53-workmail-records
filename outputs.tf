output "aws_route53_record_mx" {
  description = "Exported Attributes for `aws_route53_record.mx`."
  value       = aws_route53_record.mx
}

output "aws_route53_record_autodiscover" {
  description = "Exported Attributes for `aws_route53_record.autodiscover`."
  value       = aws_route53_record.autodiscover
}

output "aws_ses_domain_identity_main" {
  description = "Exported Attributes for `aws_ses_domain_identity.main`."
  value       = aws_ses_domain_identity.main
}

output "aws_route53_record_verification_token" {
  description = "Exported Attributes for `aws_route53_record.verification_token`."
  value       = aws_route53_record.verification_token
}

output "aws_ses_domain_dkim_main" {
  description = "Exported Attributes for `aws_ses_domain_dkim.main`."
  value       = aws_ses_domain_dkim.main
}

output "aws_route53_record_dkim" {
  description = "Exported Attributes for `aws_route53_record.dkim`."
  value       = aws_route53_record.dkim
}

output "aws_route53_record_zone_apex_txt" {
  description = "Exported Attributes for `aws_route53_record.zone_apex_txt`."
  value       = aws_route53_record.zone_apex_txt
}

output "aws_route53_record_dmarc" {
  description = "Exported Attributes for `aws_route53_record.dmarc`."
  value       = aws_route53_record.dmarc
}
