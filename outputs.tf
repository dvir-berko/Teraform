output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "s3_bucket" {
  value = aws_s3_bucket.my_bucket.bucket
}
