resource "aws_instance" "my_instance" {
  ami           = "ami-08b5b3a93ed654d19"  # Reemplaza con el AMI que necesitas
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  security_groups = [
    aws_security_group.my_security_group.name
  ]

  tags = {
    Name = "my-instance"
  }
}
