output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.main.id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "developer_access_key_id" {
  description = "Access key ID for developer user"
  value       = aws_iam_access_key.developer.id
  sensitive   = true
}

output "developer_secret_access_key" {
  description = "Secret access key for developer user"
  value       = aws_iam_access_key.developer.secret
  sensitive   = true
}

output "developer_kubeconfig_instructions" {
  description = "Instructions for developer to configure kubectl"
  value = <<-EOT
    1. Configure AWS CLI with the provided credentials:
       export AWS_ACCESS_KEY_ID="${aws_iam_access_key.developer.id}"
       export AWS_SECRET_ACCESS_KEY="${aws_iam_access_key.developer.secret}"
       export AWS_DEFAULT_REGION="${var.region}"
    
    2. Update kubeconfig:
       aws eks update-kubeconfig --region ${var.region} --name ${var.cluster_name}
    
    3. Verify access:
       kubectl get pods --all-namespaces
  EOT
  sensitive   = true
}

output "loadbalancer_url" {
  description = "Command to get the LoadBalancer URL"
  value = "kubectl get service ui -n retail-store-sample -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'"
}
