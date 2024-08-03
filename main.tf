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
