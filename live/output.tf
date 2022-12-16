output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "cidr_block" {
  value = module.vpc.vpc_cidr
}

output "db_endpoint" {
  value = module.db.aurora_endpoint
}

