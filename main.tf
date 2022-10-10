provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["Canonical"]

  filter {
    name   = "name"
    values = ["ami-0d43b5bf95246b21e"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
