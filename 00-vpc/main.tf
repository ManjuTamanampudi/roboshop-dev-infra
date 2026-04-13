module "vpc"{
    source = "../../terraform-aws-vpc"
    Project = var.Project
    Environment = var.Environment
    is_peering_required = "true"
} 