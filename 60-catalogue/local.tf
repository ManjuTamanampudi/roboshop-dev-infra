locals {
  ami_id= data.aws_ami.joindevops.id
   private_subnet_id= split(",",data.aws_ssm_parameter.private_subnet_id.value)[0]
   catalogue_sg_id =data.aws_ssm_parameter.catalogue_sg_id.value
   vpc_id = data.aws_ssm_parameter.vpc_id.value
   common_tags={
    Project= var.Project
    Environment =var.Environment
    Terraform = true
  }
  backend_alb_listener_arn =data.aws_ssm_parameter.backend_alb_listener_arn.value
}