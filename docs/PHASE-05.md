# Phase 05 — Alerting (SNS) + Failure Test

## Goal
Send email alerts when health degrades; prove end-to-end by inducing failure and recovery.

## What was added
- SNS topic `autoheal-alerts` + email subscription
- CloudWatch alarms wired to SNS:
  - UnHealthyHostCount (TG)
  - Target 5XX (TG)

## How we tested
1) Changed TG health check path to `/__down__` (via Terraform) → targets turned unhealthy.
2) Alarm state moved to **ALARM** and email alert triggered.
3) Reverted health check to `/health` → targets returned **healthy**, alarm went **OK**.

## Commands (reference)
- Show outputs: `cd infra/terraform/envs/dev && terraform output`
- Check health: `aws elbv2 describe-target-health --region ap-south-1 --target-group-arn "<TG_ARN>"`
- Alarm state: `aws cloudwatch describe-alarms --region ap-south-1 --alarm-names autoheal-web-tg-unhealthy-hosts --query 'MetricAlarms[0].StateValue'`
