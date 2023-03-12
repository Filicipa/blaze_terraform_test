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
  ami               = var.ami_id #Ubuntu server
  instance_type     = var.inst_type
  security_group_id = aws_security_group.this.id
  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }
  tags = {
    Name = "${var.appname}-instance"
  }
}