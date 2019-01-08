provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "interviewUser1"
}


/*
resource "aws_key_pair" "keys" {  
  key_name = "interviewuser1"
  public_key = "${var.ssh_key}"
}
*/

resource "aws_instance" "wordpress" {
  ami  = "ami-0032350a991893dac"
  instance_type = "t2.micro"
  key_name = "interviewuser1"

  tags = {
    Name = "Wordpress"
  }

  vpc_security_group_ids = ["${aws_security_group.wordpress_sg.id}"]

   provisioner "remote-exec" {

     inline = [ 
        
         "sudo /opt/bitnami/letsencrypt/scripts/generate-certificate.sh  -d interviews.devopsgroup.co"
        
     ]

     connection {
   user = "bitnami"
   agent = false

   }

   }

}
