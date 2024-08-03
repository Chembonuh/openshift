provider "aws" {
  region = var.region
}

resource "aws_instance" "web_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    device_name = "/dev/sdh"
    volume_size = var.volume_size
  }

  tags = var.tags

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello, World from $(hostname -f)</h1>" > /var/www/html/index.html
              EOF
}

output "web_server_url" {
  value = "http://${aws_instance.web_server.public_ip}"
}
