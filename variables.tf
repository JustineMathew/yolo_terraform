//Variables for vpc

variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default = {
    "stg"           = "192.168.128.0/19"
    "prod"          = "10.255.0.0/16"
    }
}


variable "privatesubnet_name" {
  default = {
    "stg"  = ["db-prv-1-a","db-prv-1-b","db-prv-1-c","app-prv-1-a","app-prv-1-b","app-prv-1-c",]
    "prod" = ["db-prv-1-a","db-prv-1-b","db-prv-1-c","app-prv-1-a","app-prv-1-b","app-prv-1-c",]
  }
}


variable "privatesubnet_ip" {
  type = map(list(string))
  default = {
    "stg"  = ["192.168.128.0/25","192.168.128.128/25","192.168.129.0/25","192.168.130.0/24","192.168.131.0/24","192.168.132.0/24"]
    "prod" = ["10.255.4.0/24","10.255.5.0/24","10.255.6.0/24","10.255.1.0/24","10.255.2.0/24","10.255.3.0/24"]
  }
}

variable "publicsubet_name" {
  default = {
    "stg"  = ["app-pub-1-a","app-pub-1-b","app-pub-1-c"]
    "prod" = ["app-pub-1-a","app-pub-1-b","app-pub-1-c"]
  }
}

variable "nicevalue_public" {
  default = {
    "stg"  = ["5","6","7"]
    "prod" = ["7","8","9"]
  }
}


variable "cidr_newbits" {
  default = {
    "stg"  = "5"
    "prod" = "8"
  }
}

variable "subnet_suffix" {
  default = {
    "stg"  = ["a","b","c"]
    "prod" = ["a","b","c","a","b","c"]
  }
}


