locals {
  frontend_alb_sg_id =data.aws_ssm_parameter.frontend_alb_sg_id.value
  public_subnet_ids= split(",",data.aws_ssm_parameter.public_subnet_id.value)
   common_tags={
    Project= var.Project
    Environment =var.Environment
    Terraform = true
  }
  frontend_alb_certificate_arn= data.aws_ssm_parameter.frontend_alb_certificate_arn.value
}