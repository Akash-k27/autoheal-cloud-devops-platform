output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.this.name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

output "security_group_id" {
  description = "Security group for the service"
  value       = aws_security_group.svc.id
}

output "alb_arn_suffix" {
  description = "ARN suffix for the ALB (used in CloudWatch metric dimensions)"
  value       = aws_lb.this.arn_suffix
}

output "target_group_arn_suffix" {
  description = "ARN suffix for the Target Group (used in CloudWatch metric dimensions)"
  value       = aws_lb_target_group.this.arn_suffix
}
