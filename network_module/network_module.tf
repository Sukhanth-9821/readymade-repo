variable "vpc_id" {}

resource "aws_security_group" "Sukhanth_ALL_Allow" {
  name        = "Allow_all"
  description = "Allow All inbound traffic"
  vpc_id      = "${var.vpc_id}"
    ingress = [
        {
        description      = "TLS from VPC"
        from_port        = 0
        to_port          = 65535
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false 
        }
    ]
    egress = [
    {
      description      = "for all outgoing traffics"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

   tags = {
    Name = "Sukhanth_all_SG"
  }
}

output "Sukhanth_all_SG" {
  value="${aws_security_group.Sukhanth_ALL_Allow.id}"
}