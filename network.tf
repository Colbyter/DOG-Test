resource "aws_security_group" "wordpress_sg" {
  name = "wordpress_sg"

  ingress {
    from_port   = "${var.http}"
    to_port     = "${var.http}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow SSH

  ingress {
    from_port   = "${var.ssh}"
    to_port     = "${var.ssh}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
