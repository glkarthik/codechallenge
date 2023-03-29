variable "cluster_name" {
  type    = string
  default = "codechallenge-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.22"
}

variable "worker_group_name" {
  type    = string
  default = "codechallenge-public-nodes"
}

variable "worker_group_instance_type" {
  type    = list(string)
  default = ["t2.micro"]
}

variable "autoscaling_group_min_size" {
  type    = number
  default = 4
}

variable "autoscaling_group_desired_capacity" {
  type    = number
  default = 4
}

variable "autoscaling_group_max_size" {
  type    = number
  default = 10
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "cidr_block_a" {
  type    = string
  default = "10.0.0.0/19"
}

variable "cidr_block_b" {
  type    = string
  default = "10.0.32.0/19"
}
variable "availability_zone_a" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_b" {
  type    = string
  default = "us-east-1b"
}

variable "disk_size" {
  type    = number
  default = 30
}