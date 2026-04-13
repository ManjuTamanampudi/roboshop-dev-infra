
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
  name        = mysql_policy_name
  description = "policy to access mysql password"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("mysql-iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "mysql" {
role = aws_iam_role.sql_role.name
policy_arn = aws_iam_policy.mysql.arn
}

resource "aws_iam_instance_profile" "mysql" {
  name = "${var.Project}-${var.Environment}-mysql"
  role = aws_iam_role.mysql_role.name
}