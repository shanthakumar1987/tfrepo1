
provider "aws" {

   Secret_Key: "var.secret_key"
   Access_Key: "var.access_key"
 
  region =  "us-east-1"
  
}

terraform {

 backend "s3" {

   region = "us-east-1"

   bucket = "test-nts15"

   dynamodb_table = "tflcktable"   

   key = "terraform.tfstate"

   

 }

}


variable "access_key" {
 type =string

}
variable "secret_key" {
 type = string
}

variable "keyname" {

 type = string

}



resource "tls_private_key" "rsa" {

algorithm = "RSA"

rsa_bits = 4096

}



resource "aws_key_pair" "tf-key-pair" {

key_name = var.keyname

public_key = tls_private_key.rsa.public_key_openssh

}



resource "local_file" "tf-key" {

content = tls_private_key.rsa.private_key_pem

filename = var.keyname

}


