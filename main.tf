provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "foo" {
  ami                    = "ami-0eae2a0fc13b15fce"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0e768ed6dc6ac2f95"]
  subnet_id              = "subnet-0d60de508ecf74c25"
  tags = {
    Name = "TF-Instance"
  }
}
