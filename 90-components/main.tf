module "main" {
    for_each = var.component
  source = "git::https://github.com/ManjuTamanampudi/terraform-roboshop-components.git?ref=main"
  component = each.key
  rule_priority = each.value.rule_priority
}