output "application-repository-name" {
  value = "${aws_ecr_repository.container_repository.name}"
}
output "application-repository-url" {
  value = "${aws_ecr_repository.container_repository.repository_url}"
}