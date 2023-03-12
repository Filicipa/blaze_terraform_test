resource "aws_vpc" "this" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_security_group" "this" {
  name        = "${var.appname}-sg"
  description = "Security Group for test ${var.appname}"
  vpc_id      = aws_vpc.this.id
}

resource "aws_security_group_rule" "access_from_internet" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  for_each          = toset(["22", "80", "443"])
  from_port         = each.key
  to_port           = each.key
  description       = "Allow connecting from internet to port ${each.key}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_from_vpc" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  description       = "Allow connecting from VPC"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "access_from_anywhere" {
  security_group_id = aws_security_group.this.id
  description       = "Allow outbound traffic"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}
