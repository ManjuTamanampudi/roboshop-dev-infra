data "aws_ami" "openvpn" {
  most_recent = true
  owners =["679593333241"]

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-fe8020db-*"]
  }

filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.Project}/${var.Environment}/public_subnet_id"
}
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.Project}/${var.Environment}/bastion_sg_id"
}
data "aws_ssm_parameter" "openvpn_sg_id" {
  name = "/${var.Project}/${var.Environment}/openvpn_sg_id"
}