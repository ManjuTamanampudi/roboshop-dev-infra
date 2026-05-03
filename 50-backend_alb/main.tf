resource "aws_lb" "backend_alb" {
  name               = "${var.Project}-${var.Environment}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  # alb must be created in atleast in 2 AZ's
  subnets            = local.private_subnet_ids 
# keeping it false to delete it from terraform
  enable_deletion_protection = false
  tags = merge({
    Name = "${var.Project}-${var.Environment}"   
  },
   local.common_tags )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> This is default response fron backend alb </h1>"
      status_code  = "200"
    }
  }
}


# aws provides alb only with alias names not with ip's
resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.Environment}.${var.domain_name}"
  type    = "A"
#  loadbalancer details
  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}