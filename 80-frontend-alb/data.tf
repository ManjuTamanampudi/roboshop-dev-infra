
data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "/${var.Project}/${var.Environment}/frontend_alb_sg_id"
}
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.Project}/${var.Environment}/public_subnet_id"
}
data "aws_ssm_parameter" "frontend_alb_certificate_arn" {
  name = "/${var.Project}/${var.Environment}/frontend_alb_certificate_arn"
}
