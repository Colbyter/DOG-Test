provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "interviewUser1"
}



resource "aws_instance" "wordpress" {
  ami  = "ami-0032350a991893dac"
  instance_type = "t2.micro"
  key_name = "dog-test"

  tags = {
    Name = "Wordpress"
  }

  vpc_security_group_ids = ["${aws_security_group.wordpress_sg.id}"]

   
}
