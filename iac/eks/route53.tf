resource "aws_route53_zone" "this" {
  name = var.route53.domain_name

  tags = merge(
    var.tags,
    {
      Name = var.route53.domain_name
    }
  )
}
# Atualiza a variável zone_id com o ID da zona recém-criada
output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "O ID da zona hospedada criada no Route 53"
}
output "nameservers" {
  value       = aws_route53_zone.this.name_servers
  description = "Os nameservers da zona hospedada (necessários para configurar no registrador do domínio)"
} 