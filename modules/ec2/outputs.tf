output "web_server_instance_ids" {
  value = aws_autoscaling_group.web_asg.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}