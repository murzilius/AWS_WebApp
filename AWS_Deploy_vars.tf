//Region defenition for AWS servers landing
variable "region" {
  type    = string
  default = "us-east-2"
  description = "REGION defenition"
}
//Instance type defenition
variable "instance" {
  type    = string
  default = "t2.micro"
  description = "Instance type defenition"
}

//Path for DEPLOY Server PRIVATE KEY to access WEB servers via SSH
variable "id_rsa_key_path" {
  type    = string
}

variable "EnvVARS" {
  type = map
  default = {     }
}

// Define Instance count for Web servers and names of instances
variable "instance_tags" {
  type = list(string)
  default = ["Web server 1", "Web Server 2"]
}


// Define List of outter ports to open
variable "ingress_ports" {
  type = list(string)
  default = [  "80","8080","22","443"  ]
}
// Define List of inner ports to map from output 
variable "egress_ports" {
  type = list(string)
  default = [  "0"  ]
}
//Define ingress cidr block IP's
variable "ingress_IPs" {
  type = list(string)
  default = [  "0.0.0.0/0" ]
}

// Define egress cidr block IP's
variable "egress_IPs" {
  type = list(string)
  default = [  "0.0.0.0/0" ]
}

//Path for Server's PUBLIC KEY
variable "pub_key_path" {
  type    = string
}