provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "name"
    values = ["myami-*"]
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
