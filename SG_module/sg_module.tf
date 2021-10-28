 variable "ingressrules" {
   type = list(number)
   default=[8080,22]
 }

resource "aws_security_group" "web_traffic1" {
  name="Allow web traffic1"
  description = "Allow web traffic1"
  dynamic "ingress" {
    iterator=port
    for_each=var.ingressrules
    content{
        from_port=port.value
        to_port=port.value
        protocol="TCP"
        cidr_blocks=["0.0.0.0/0"]
    }
  }
  egress {
      from_port=0
      to_port=0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags={
    "Name"= "Newlyyycreatedsecuritygroup"
}
}

output "SG_new" {
  value="${resource.aws_security_group.web_traffic1.id}"
}