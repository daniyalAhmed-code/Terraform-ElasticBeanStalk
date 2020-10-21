output "public-subnets" {
  value = "${join(",", aws_subnet.public-subnets.*.id)}"
}
output "private-subnets" {
  value = "${join(",", aws_subnet.private-subnets.*.id)}"
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}