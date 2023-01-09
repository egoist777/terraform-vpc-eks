variable "vpc_name" {
  type    = string
  default = "eks-vpc"
}

variable "cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "eks_cluster_name" {
  type    = string
  default = "test-cluster"
}


# Node Group 1

variable "instance_type_one" {
  type    = string
  default = "t2.micro"
}

variable "worker_group_one_name" {
  type    = string
  default = "group-1"
}

# Node Group 2

variable "instance_type_two" {
  type    = string
  default = "t2.small"
}

variable "worker_group_two_name" {
  type    = string
  default = "group-2"
}
