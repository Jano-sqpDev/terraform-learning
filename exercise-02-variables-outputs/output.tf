output "exercise" {
  description = "Exercise number:"
  value       = local.long_name
}

output "public_ip" {
  description = "Public IP:"
  value       = aws_instance.server.public_ip
}

output "instance_id" {
  description = "Instance ID:"
  value       = aws_instance.server.id
}

output "ssh_command" {
  description = "SSH command to connect"
  value       = "ssh -i ~/.ssh/aws_key ubuntu@${aws_instance.server.public_ip}"
}

output "website_url" {
  description = "nginx website URL"
  value       = "http://${aws_instance.server.public_ip}"
}