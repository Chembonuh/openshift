resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  tags = var.tags
}

output "instance_id" {
  value = aws_instance.web_server.id
}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
