variable "vpc_name" {
  default = "ecsdemo"
}

variable "env" {
  default = "demo"
}

variable "region" {
  default = "ap-south-1"
}

variable "region-az1" {
  default = "ap-south-1a"
}

variable "region-az2" {
  default = "ap-south-1c"
}

variable "vpc_cidr" {
  default = "172.20.0.0/16"
}

variable "private_subnet_cidr-az1" {
  default = "172.20.20.0/24"
}

variable "private_subnet_cidr-az2" {
  default = "172.20.21.0/24"
}

variable "private_subnet_name-az1" {
  default = "private-1"
}

variable "private_subnet_name-az2" {
  default = "private-2"
}

variable "public_subnet_cidr-az1" {
  default = "172.20.10.0/24"
}

variable "public_subnet_cidr-az2" {
  default = "172.20.11.0/24"
}

variable "public_subnet_name-az1" {
  default = "public-1"
}

variable "public_subnet_name-az2" {
  default = "public-2"
}

variable "region-key" {
  default = "devops"
}

variable "ecs_cluster_name" {
  default = "wpcluster"
}

variable "max_instance_size" {
  default = "3"
}

variable "min_instance_size" {
  default = "1"
}

variable "desired_capacity" {
  default = "1"
}
