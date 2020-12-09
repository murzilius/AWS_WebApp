provider "aws" {
  region = var.region //++
}
// Deploy server defenition
resource "aws_instance" "Deploy" {
  ami           = data.aws_ami.ubuntu_latest.id
  instance_type = var.instance //++
  tags = {
    Name = "Server for Deploy"
  }
  vpc_security_group_ids = [ aws_security_group.test_security_group.id ]
 
  key_name="AWS_for_test"
  user_data=templatefile(
               "${path.module}/template/deploy.sh.tmpl",
               {
                EnvVARS = var.EnvVARS,
                public_ip_for_Web = join("\n" ,aws_instance.Server[*].public_ip),
                GITHUB_REPO_NAME = var.EnvVARS["GITHUB_REPO_NAME"],
                GITHUB_REPO_PATH = var.EnvVARS["GITHUB_REPO_PATH"]
                }
              )
  provisioner "file" {
    source      = var.id_rsa_key_path //++
    destination = "/home/ubuntu/.ssh/id_rsa"
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file(var.id_rsa_key_path)
    host = self.public_ip
    }
  } 
  
}
//Web Servers defenition
resource "aws_instance" "Server" {
  ami           = data.aws_ami.ubuntu_latest.id
  instance_type = var.instance //++
  count         = length(var.instance_tags)
   tags = {
    Name  = element(var.instance_tags, count.index)
  }
  vpc_security_group_ids = [ aws_security_group.test_security_group.id ]
  key_name="AWS_for_test"
  
}
//Creating Security Group
resource "aws_security_group" "test_security_group" {
  name        = "test Security Group"
  description = "To allow Web Access"

  dynamic "ingress" {
    for_each = var.ingress_ports //++
    content {
      from_port   = ingress.value
      protocol    = "tcp"
      to_port     = ingress.value
      cidr_blocks = var.ingress_IPs  //++
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports //++
    content { 
      from_port   = egress.value
      protocol    = "-1"
      to_port     = egress.value
      cidr_blocks = var.egress_IPs //++
    }
  }
}

resource "aws_key_pair" "AWS" {
  key_name   = "AWS_for_test"
  public_key = file(var.pub_key_path)                  //give servers Public Key
}
//Define latest image og Ubuntu 20.04 server for given region
data "aws_ami" "ubuntu_latest"{     
 owners = ["099720109477"]
 most_recent = true
filter {
  name = "name"
  values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}
}

output "public_ip_for_Web" {     //output public IP for Deploy server
  value = aws_instance.Server[*].public_ip
  description = "Web servers PUBLIC IP's"
}
output "public_ip_for_Deploy" {     //output public IP for Deploy server
  value = aws_instance.Deploy.public_ip
}
