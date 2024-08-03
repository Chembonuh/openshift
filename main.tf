provider "aws" {
  region = var.region
}

module "web_server" {
  source = "./web"
  instance_ami = var.instance_ami
  instance_type = var.instance_type
  volume_size = var.volume_size
  tags = var.tags
}
