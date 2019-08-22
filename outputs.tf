output "ownership" {
  value       = aws_route53_record.ownership.name
  description = "interpolated value of `aws_route53_record.ownership.name`"
}

output "mx" {
  value       = aws_route53_record.mx.name
  description = "interpolated value of `aws_route53_record.mx.name`"
}

output "autodiscover" {
  value       = aws_route53_record.autodiscover.name
  description = "interpolated value of `aws_route53_record.autodiscover.name`"
}

output "dkim-1" {
  value       = aws_route53_record.dkim-1.name
  description = "interpolated value of `aws_route53_record.dkim-1.name`"
}

output "dkim-2" {
  value       = aws_route53_record.dkim-2.name
  description = "interpolated value of `aws_route53_record.dkim-2.name`"
}

output "dkim-3" {
  value       = aws_route53_record.dkim-3.name
  description = "interpolated value of `aws_route53_record.dkim-3.name`"
}

output "spf" {
  value       = aws_route53_record.spf.name
  description = "interpolated value of `aws_route53_record.spf.name`"
}

output "dmarc" {
  value       = aws_route53_record.dmarc.name
  description = "interpolated value of `aws_route53_record.dmarc.name`"
}

output "mx_record" {
  value       = local.mx_record
  description = "interpolated value of `local.mx_record`"
}

output "autodiscover_record" {
  value       = local.autodiscover_record
  description = "interpolated value of `local.autodiscover_record`"
}

output "zone_name" {
  value       = local.zone_name
  description = "interpolated value of `local.zone_name`"
}