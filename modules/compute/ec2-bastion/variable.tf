variable "key_name" {
}

variable "ami" {
}

variable "subnet-id" {
}

variable "env" {
}

# variable "id" {
# }

variable "instance-type" {
  default = "t2.micro"
}

variable "region" {
}

variable "az" {
}

variable "security-group" {
  type = list(string)
}