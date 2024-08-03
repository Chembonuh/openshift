variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-2"
}

variable "instance_ami" {
  description = "The AMI ID for the web server instance"
  type        = string
  default     = "ami-0c11a84584d4e09dd"  # Example AMI ID
}

variable "instance_type" {
  description = "The instance type for the web server"
  type        = string
  default     = "t2.micro"
}

variable "volume_size" {
  description = "The size of the EBS volume in GB"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
    Name        = "webserver"
    Environment = "Production"
    Project     = "Website"
  }
}
