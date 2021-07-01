resource "aws_eks_node_group" "devops-nodes" {
  cluster_name    = aws_eks_cluster.devops.name
  node_group_name = "devops-nodes"
  node_role_arn   = aws_iam_role.devops.arn
  subnet_ids = "${module.vpc.private_subnets[*]}"

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.devops-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.devops-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.devops-AmazonEC2ContainerRegistryReadOnly,
  ]
}

