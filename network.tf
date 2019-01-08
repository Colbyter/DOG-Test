resource "aws_security_group" "wordpress_sg" {
  name = "wordpress_sg"
  
  #Allow traffic on port 80
  ingress {
    from_port   = "${var.http}"
    to_port     = "${var.http}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow Traffic on port 443 (HTTPS)
  ingress {
    from_port   = "${var.https}"
    to_port     = "${var.https}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Allow Outbound traffic on all ports
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
