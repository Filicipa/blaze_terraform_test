variable "appname" {
  description = "Name of app"
  type        = string
  default     = "OMOMO-DEV"
}

variable "region" {
  description = "EC2 region"
  type        = string
  default     = "eu-central-1"
}

variable "ami_id" {
  description = "AMI for instance"
  type        = string
  default     = "ami-0d1ddd83282187d18" #Ubuntu server
}

variable "inst_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t2.micro"
}

variable "cidr_vpc" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "cidr_sn" {
  description = "CIDR block for Subnet"
  type        = string
  default     = "192.168.0.0/20"
}
