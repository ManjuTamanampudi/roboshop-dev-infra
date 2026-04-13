resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.Project}/${var.Environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}
resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/${var.Project}/${var.Environment}/public_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_public)
}

resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/${var.Project}/${var.Environment}/private_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_private)
}
resource "aws_ssm_parameter" "db_subnet_id" {
  name  = "/${var.Project}/${var.Environment}/db_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_db)
}
