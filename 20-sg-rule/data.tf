
data "http" "my_public_ip_v4" {
  url = "https://ipv4.icanhazip.com"
}
output "my_ipv4_address" {
  value = chomp(data.http.my_public_ip_v4.response_body)
}

data "aws_ssm_parameter" "catalouge_sg_id" {
  name = "/${var.Project}/${var.Environment}/catalouge_sg_id"
}
data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.Project}/${var.Environment}/mongodb_sg_id"
}
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.Project}/${var.Environment}/bastion_sg_id"
}
data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.Project}/${var.Environment}/user_sg_id"
}
data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.Project}/${var.Environment}/redis_sg_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.Project}/${var.Environment}/mysql_sg_id"
}
data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.Project}/${var.Environment}/rabbitmq_sg_id"
}
data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.Project}/${var.Environment}/backend_alb_sg_id"
}
