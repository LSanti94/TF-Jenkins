provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "foo" {
  ami           = "ami-0eae2a0fc13b15fce"
  instance_type = "t2.micro"
  tags = {
    Name = "TF-Instance"
  }
}
