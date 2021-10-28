
module "SG_module" {
  source = "../SG_module"
  
}

resource "aws_instance" "Jenkins-Server" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name="nouse"
  vpc_security_group_ids =["${module.SG_module.SG_new}"]
  user_data = "${file("install_jenkins.sh")}"
  tags  = {
    "Name"      = "Jenkins_EC2"
      }
 }

resource "aws_instance" "Docker-Server" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name="nouse"
  vpc_security_group_ids =["${module.SG_module.SG_new}"]
  user_data = "${file("install_docker.sh")}"
  tags  = {
    "Name"      = "Docker_EC2"
      }
}

# resource "aws_instance" "Docker-Server" {
#   ami           = "ami-02e136e904f3da870"
#   instance_type = "t2.micro"
#   key_name="nouse"
#   vpc_security_group_ids =["${module.SG_module.SG_new}"]
#   user_data = "${file("install_docker.sh")}"
#   tags  = {
#     "Name"      = "Docker_EC2"
#       }
# }

resource "aws_instance" "Ansible-Server" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name="nouse"
  vpc_security_group_ids =["${module.SG_module.SG_new}"]
  user_data = "${file("install_ansible.sh")}"
  tags  = {
    "Name"      = "Ansible_EC2"
      }
}