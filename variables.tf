variable "cluster_name" {
  type        = string
  default     = "codechallenge-cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.22"
}

variable "worker_group_name" {
  type        = string
  default     = "codechallenge-public-nodes"
}

variable "worker_group_instance_type" {
  type        = list(string)
  default     = ["t2.micro"]
}

variable "autoscaling_group_min_size" {
  type        = number
  default     = 4
}

variable "autoscaling_group_desired_capacity" {
  type        = number
  default     = 4
}

variable "autoscaling_group_max_size" {
  type        = number
  default     = 10
}

variable "capacity_type" {
    type        = string
  default       = "ON_DEMAND"
}