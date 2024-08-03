output "public_ip_output" {
  description = "public ip of ec2"
  value       = aws_instance.demo1_ec2_instance.public_ip
}