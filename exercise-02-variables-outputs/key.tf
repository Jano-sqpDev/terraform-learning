# Assign Key for SSH
resource "aws_key_pair" "key_exer1a" {
  key_name = "aws_key"
  public_key = file("~/.ssh/aws_key.pub")
}
