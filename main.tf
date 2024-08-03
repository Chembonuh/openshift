provider "aws" {
  region = var.region
}

resource "aws_instance" "regular_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.tags

  root_block_device {
    volume_size = var.volume_size
  }
}
 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello, World from $(hostname -f)</h1>" > /var/www/html/index.html
              EOF
}

