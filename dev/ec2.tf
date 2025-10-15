resource "aws_instance" "testvm" {

  ami             = var.ami
  instance_type   = var.inst-type
  key_name        = "ferrari"
  security_groups = ["default"]
  tags = {

    Name = "test-vm"
  }
}