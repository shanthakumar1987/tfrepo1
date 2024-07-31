provider "aws" {

   Secret_Key: "var.secret_key"
   Access_Key: "var.access_key"
 
  region =  "us-east-1"
  
}

variable "access_key" {
 type =string

}
variable "secret_key" {
 type = string
}

esource "aws_vpc" "shanth-vpc" {
    cidr_block = "192.179.0.0/24"
    tags = {
      "Name"= "shanth123"
    }
  
}

