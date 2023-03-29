module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.28.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids = [
    aws_subnet.codechallenge-public-subnet-2a.id,
    aws_subnet.codechallenge-public-subnet-2b.id
  ]
  vpc_id = aws_vpc.codechallenge-vpc.id


  eks_managed_node_group_defaults = {
    instance_types = var.worker_group_instance_type
    disk_size      = var.disk_size
  }

  eks_managed_node_groups = {
    workernode = {
      min_size     = var.autoscaling_group_min_size
      max_size     = var.autoscaling_group_max_size
      desired_size = var.autoscaling_group_desired_capacity

      instance_types = var.worker_group_instance_type
      capacity_type  = var.capacity_type
      labels = {
        Environment = "codechallenge"
      }
    }
  }
}