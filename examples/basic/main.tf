# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "example" {
  # AWS reserves `domain.com` and the commonly-known alternative TLDs
  # `.example` is considered a safe space according to RFC 2606.
  name = "domain.example"
}

module "workmail_records" {
  source = "../../"

  zone_id       = aws_route53_zone.example.zone_id
  workmail_zone = "us-west-2"
}
