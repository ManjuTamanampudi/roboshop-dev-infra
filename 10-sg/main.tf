module "sg" {
    count= length(var.sg_name)
    source = "../../terraform-aws-sg"
    Project = var.Project
    Environment = var.Environment
 sg_name = replace(var.sg_name[count.index],"_","-")
 vpc_id = local.vpc_id
}
