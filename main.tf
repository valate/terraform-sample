provider "aws" {
  region = var.region
}

data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["linux/images/hvm-ssd/-kernel-5.10-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["167357161503"] # Canonical
}

resource "aws_instance" "linux" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
