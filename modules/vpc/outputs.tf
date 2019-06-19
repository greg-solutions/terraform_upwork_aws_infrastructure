output "id" {
  value = "${aws_vpc.private_vpc.id}"
}
output "vpc-name-alias" {
  value = "${aws_vpc.private_vpc.tags.Name}"
}
output "public-subnet-ids" {
  value = [
    "${aws_subnet.public_subnet.*.id}"]
}
output "private-subnet-ids" {
  value = [
    "${aws_subnet.private_subnet.*.id}"]
}
output "public-subnet-cidr-block-list" {
  value = [
    "${aws_subnet.public_subnet.*.cidr_block}"]
}
output "private-subnet-cidr-block-list" {
  value = [
    "${aws_subnet.private_subnet.*.cidr_block}"]
}
output "internet-gateway-id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}
output "private-subnet-routes-id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}