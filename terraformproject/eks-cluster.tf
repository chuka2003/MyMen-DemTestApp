resource "aws_eks_cluster" "devops" {
  name     = "devops-eks"
  role_arn = aws_iam_role.devops.arn

  vpc_config {
    subnet_ids = "${module.vpc.private_subnets[*]}"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.devops-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.devops-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.devops.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.devops.certificate_authority[0].data
}
