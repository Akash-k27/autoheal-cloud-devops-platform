output "alb_dns_name" {
  value       = module.svc.alb_dns_name
  description = "DNS name of the ALB"
}

output "asg_name" {
  value       = module.svc.asg_name
  description = "Auto Scaling Group name"
}

output "target_group_arn" {
  value       = module.svc.target_group_arn
  description = "Target Group ARN"
}

output "security_group_id" {
  value       = module.svc.security_group_id
  description = "Service Security Group ID"
}

output "alb_arn_suffix" {
  value       = module.svc.alb_arn_suffix
  description = "ALB ARN suffix for CloudWatch dimensions"
}

output "target_group_arn_suffix" {
  value       = module.svc.target_group_arn_suffix
  description = "Target Group ARN suffix for CloudWatch dimensions"
}
