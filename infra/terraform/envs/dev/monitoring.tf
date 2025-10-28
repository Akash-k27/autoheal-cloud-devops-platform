# ---- SNS Alerts for Alarms ----
resource "aws_sns_topic" "alerts" {
  name = "autoheal-alerts"
}

# Email subscription (confirm from your inbox)
resource "aws_sns_topic_subscription" "alerts_email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "akash.k.22204@gmail.com" # change if you prefer
}

# ---- CloudWatch Alarms for ALB/Target Group ----

# 1) Unhealthy targets alarm (with SNS actions)
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

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]
}

# 2) Target 5XX errors alarm (with SNS actions)
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

  alarm_actions = [aws_sns_topic.alerts.arn]
  ok_actions    = [aws_sns_topic.alerts.arn]
}

# ---- CloudWatch Dashboard ----
resource "aws_cloudwatch_dashboard" "autoheal_dashboard" {
  dashboard_name = "autoheal-cloud-dev"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0, y = 0, width = 12, height = 6,
        properties = {
          title = "ALB RequestCount",
          view = "timeSeries",
          region = "ap-south-1",
          metrics = [
            [ "AWS/ApplicationELB", "RequestCount", "LoadBalancer", module.svc.alb_arn_suffix ]
          ],
          stat = "Sum",
          period = 60
        }
      },
      {
        type = "metric",
        x = 12, y = 0, width = 12, height = 6,
        properties = {
          title = "Target 5XX",
          view = "timeSeries",
          region = "ap-south-1",
          metrics = [
            [ "AWS/ApplicationELB", "HTTPCode_Target_5XX_Count", "LoadBalancer", module.svc.alb_arn_suffix, "TargetGroup", module.svc.target_group_arn_suffix ]
          ],
          stat = "Sum",
          period = 60
        }
      },
      {
        type = "metric",
        x = 0, y = 6, width = 12, height = 6,
        properties = {
          title = "Targets Health",
          view = "timeSeries",
          region = "ap-south-1",
          metrics = [
            [ "AWS/ApplicationELB", "HealthyHostCount", "LoadBalancer", module.svc.alb_arn_suffix, "TargetGroup", module.svc.target_group_arn_suffix ],
            [ ".", "UnHealthyHostCount", ".", ".", ".", "." ]
          ],
          stat = "Maximum",
          period = 60
        }
      },
      {
        type = "metric",
        x = 12, y = 6, width = 12, height = 6,
        properties = {
          title = "ASG InService Instances",
          view = "timeSeries",
          region = "ap-south-1",
          metrics = [
            [ "AWS/AutoScaling", "GroupInServiceInstances", "AutoScalingGroupName", module.svc.asg_name ]
          ],
          stat = "Maximum",
          period = 60
        }
      }
    ]
  })
}
