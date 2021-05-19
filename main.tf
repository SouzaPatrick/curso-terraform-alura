provider "aws" {
  version = "~> 3.0"
  region = "us-east-1"
}

resource "aws_key_pair" "terraform_aws" {
  key_name = "terraform-aws"
  public_key = "${file("C:\\Users\\Felip\\.ssh\\terraform-aws.pub")}"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev${count.index}"
  }
}