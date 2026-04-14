
resource "aws_iam_role" "sql_role" {
  name = local.mysql_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

   tags = merge(
    local.common_tags,
{
    Name = local.mysql_role_name
  })
}
resource "aws_iam_policy" "mysql" {
  name        = local.mysql_policy_name
  description = "policy to access mysql password"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = templatefile("mysql-iam-policy.json",{
    env = var.Environment
    })
}

resource "aws_iam_role_policy_attachment" "mysql" {
role = aws_iam_role.sql_role.name
policy_arn = aws_iam_policy.mysql.arn
}

resource "aws_iam_instance_profile" "mysql" {
  name = "${var.Project}-${var.Environment}-mysql"
  role = aws_iam_role.mysql_role.name
}




# rabbitmq iam 


resource "aws_iam_role" "rabbitmq_role" {
  name = local.rabbitmq_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

   tags = merge(
    local.common_tags,
{
    Name = local.mysql_role_name
  })
}
resource "aws_iam_policy" "rabbitmq" {
  name        = local.rabbitmq_policy_name
  description = "policy to access rabbitmq password"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = templatefile("rabbitmq-iam-policy.json",{
    env = var.Environment
    })
}

resource "aws_iam_role_policy_attachment" "rabbitmq" {
role = aws_iam_role.sql_role.name
policy_arn = aws_iam_policy.rabbitmq.arn
}

resource "aws_iam_instance_profile" "rabbitmq" {
  name = "${var.Project}-${var.Environment}-rabbitmq"
  role = aws_iam_role.rabbitmq_role.name
}