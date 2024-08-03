
output "instance_id" {
  description = "The ID of the web server instance"
  value       = module.web_server.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the web server instance"
  value       = module.web_server.instance_public_ip
}
