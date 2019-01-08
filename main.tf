provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  profile    = "interviewUser1"
}



resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



resource "aws_key_pair" "keys" {  
  key_name = "dog-test"
  public_key = "${tls_private_key.terraform_key.public_key_openssh}"
}



resource "aws_instance" "wordpress" {
  ami  = "ami-0032350a991893dac"
  instance_type = "t2.micro"
  key_name = "${aws_key_par.keys.key_name}"

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
   #host_key = "${var.ssh_key}"
   private_key = "${tls_private_key.terraform_key.private_key_pem}"

   }

   }

}
