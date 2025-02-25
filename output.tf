output "vpc_id" {
  value = aws_vpc.main.id
}
output "web_server_ip" {
  value = aws_instance.web_server.public_ip
}
output "load_balancer_dns" {
  value = aws_lb.web_lb.dns_name
}
output "rds_endpoint" {
  value = aws_db_instance.mysql_db.endpoint
}
output "web_server_ip" {
  value = module.ec2.web_server_ip
}
output "load_balancer_dns" {
  value = module.alb.load_balancer_dns
}
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
