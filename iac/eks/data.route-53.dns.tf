data "aws_route53_zone" "this" {
  name = var.route53.domain_name
}
