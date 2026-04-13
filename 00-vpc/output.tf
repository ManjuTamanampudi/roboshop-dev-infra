
output "vpc_id" {
    value = module.vpc.vpc_id
}
output "subnet_public" {
    value = module.vpc.subnet_public
}
output "subnet_private" {
    value = module.vpc.subnet_private
}
output "subnet_db" {
    value = module.vpc.subnet_db
}