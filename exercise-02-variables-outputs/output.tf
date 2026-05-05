output "public_ip" {
    description = "Public IP:"
    value = aws_instance.server-ubuntu-exer1a.public_ip
}

output "instance_id" {
    description = "Instance ID:"
    value = aws_instance.server-ubuntu-exer1a.id
}

