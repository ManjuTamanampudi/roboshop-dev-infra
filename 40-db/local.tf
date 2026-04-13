locals {
   ami_id= data.aws_ami.joindevops.id
   db_subnet_id= split(",",data.aws_ssm_parameter.db_subnet_id.value)[0]
   mongodb_sg_id =data.aws_ssm_parameter.mongodb_sg_id.value
   redis_sg_id =data.aws_ssm_parameter.redis_sg_id.value
   common_tags={
    Project= var.Project
    Environment =var.Environment
    Terraform = true
  }

}