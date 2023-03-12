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
  default     = "eu-central-1"
}

variable "inst_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t2.micro"
}