provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "interviewuser1"
}

resource "aws_instance" "wordpress" {
  ami           = "ami-0010387e90774e027"
  instance_type = "t2.micro"

  tags = {
    Name = "Wordpress"
  }

  vpc_security_group_ids = ["${aws_security_group.wordpress_sg.id}"]

}
