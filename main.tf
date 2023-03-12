terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  vpc_security_group_ids = [aws_security_group.this.id]
  #  subnet_id              = aws_subnet.default.id
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
  tags = {
    Name = "${var.appname}-instance"
  }
}