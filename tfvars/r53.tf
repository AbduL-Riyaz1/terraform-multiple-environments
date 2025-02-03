/* resource "aws_route53_record" "expense" {
  count = 3
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #interpolatio to get mysql.ardev.space
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip] #list type
  allow_overwrite = true   #if no records is present in your r53 ignore this
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "${var.domain_name}" 
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[2].public_ip] #list type
  allow_overwrite = true   #if no records is present in your r53 ignore this
} */