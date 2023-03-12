#data "aws_vpc" "this" {
#  id = aws_default_vpc.this.id
#}

#data "aws_security_group" "this" {
#  filter {
#    name   = "tag:Name"
#    values = ["default"]
#  }
#}