output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.web_server.public_ip
}

output "instance_volume_size" {
  description = "The size of the root volume"
  value       = aws_instance.web_server.root_block_device[0].volume_size
}
