resource "aws_ssm_parameter" "frontend_alb_certificate_arn" {
  name  = "/${var.Project}/${var.Environment}/frontend_alb_certificate_arn"
  type  = "String"
  value = aws_acm_certificate.roboshop.arn
}