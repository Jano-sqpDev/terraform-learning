# Assign Key for SSH
resource "aws_key_pair" "aws_key" {
  key_name = "aws_key"
  public_key = file(var.public_key_path)
}
