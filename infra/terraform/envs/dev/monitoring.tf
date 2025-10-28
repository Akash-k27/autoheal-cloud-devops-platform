# CloudWatch Alarms for ALB/Target Group

# 1) Unhealthy targets alarm
resource "aws_cloudwatch_metric_alarm" "tg_unhealthy_hosts" {
  alarm_name          = "autoheal-web-tg-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Maximum"
  threshold           = 0

  dimensions = {
    LoadBalancer = module.svc.alb_arn_suffix
    TargetGroup  = module.svc.target_group_arn_suffix
  }

  alarm_description = "Triggers when any target becomes unhealthy in the Target Group for 2 minutes."
}

# 2) Target 5XX errors alarm
resource "aws_cloudwatch_metric_alarm" "tg_5xx" {
  alarm_name          = "autoheal-web-target-5xx"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 0

  dimensions = {
    LoadBalancer = module.svc.alb_arn_suffix
    TargetGroup  = module.svc.target_group_arn_suffix
  }

  alarm_description = "Triggers when targets behind the ALB return any 5XX responses for 2 minutes."
}
