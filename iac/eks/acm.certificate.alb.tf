resource "aws_acm_certificate" "this" {
  domain_name       = "leandrospferreira.com.br"
  validation_method = "DNS"
  tags              = var.tags
}

#Comentando a configuração do certificado ACM e seus registros DNS
resource "aws_route53_record" "this" {
  name            = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_name
  records         = [tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_value]
  type            = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_type
  zone_id         = data.aws_route53_zone.this.zone_id
  ttl             = 60
  allow_overwrite = true
}
resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [aws_route53_record.this.fqdn]
}
