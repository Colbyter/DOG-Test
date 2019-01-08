output "ip" {
  value = "${aws_instance.wordpress.public_ip}"
}
