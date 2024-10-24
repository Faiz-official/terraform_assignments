output "elb_dns_name" {
  value = module.elb.elb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "web_server_instance_ids" {
  value = module.ec2.web_server_instance_ids
}