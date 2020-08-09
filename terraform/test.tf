resource "aws_instance" "web" {
  ami           = "ami-03ba3948f6c37a4b0"
  instance_type = "t2.micro"

  tags = {
    Name = "jenkins_builder"
  }
}