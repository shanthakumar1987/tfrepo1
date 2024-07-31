provider "aws" {
 
  region =  "us-east-1"
  
}


module "dasam_first_module" {
    source = "./demo_mod1"
    bucket_name = "shantha-kumare"
    var_cidr = "192.162.0.0/24"
    var_name = "shantha-demo-vpc"
  
}
