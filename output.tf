output "instance_id" {
  description = "The ID of the web server instance"
  value       = module.web_server.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the web server instance"
  value       = module.web_server.instance_public_ip
}
output "instance_volume_size" {
  description = "The size of the root volume"
  value       = aws_instance.regular_instance.root_block_device[0].volume_size
}
