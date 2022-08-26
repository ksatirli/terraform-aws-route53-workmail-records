# see https://www.terraform.io/language/modules/develop/refactoring#moved-block-syntax

moved {
  from = aws_ses_domain_identity.identity
  to   = aws_ses_domain_identity.main
}

moved {
  from = aws_ses_domain_dkim.dkim
  to   = aws_ses_domain_identity.main
}
