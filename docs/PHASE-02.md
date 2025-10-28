Phase 02 — Outputs & Monitoring
Goal

Expose helpful Terraform outputs and add basic CloudWatch alarms for auto-heal visibility.

What was added

Terraform outputs (env level):

alb_dns_name, asg_name, security_group_id

target_group_arn, alb_arn_suffix, target_group_arn_suffix

CloudWatch alarms:

autoheal-web-tg-unhealthy-hosts — alerts if any target is unhealthy

autoheal-web-target-5xx — alerts on target 5XX responses

Why this matters

Recruiters can see results quickly (copy-paste terraform output).

Alarms prove the system is observable and reacts to failures.

How to view outputs

Go to your dev environment folder:
cd infra/terraform/envs/dev

Run:
terraform output

Next (Phase 03)

GitHub Actions: terraform fmt/validate/plan on PRs

Optional: require signed commits + branch protections

Phase 02 — Outputs & Monitoring
Goal

Expose helpful Terraform outputs and add basic CloudWatch alarms for auto-heal visibility.

What was added

Terraform outputs (env level):

alb_dns_name, asg_name, security_group_id

target_group_arn, alb_arn_suffix, target_group_arn_suffix

CloudWatch alarms:

autoheal-web-tg-unhealthy-hosts — alerts if any target is unhealthy

autoheal-web-target-5xx — alerts on target 5XX responses

Why this matters

Recruiters can see results quickly (copy-paste terraform output).

Alarms prove the system is observable and reacts to failures.

How to view outputs

Go to your dev environment folder:
cd infra/terraform/envs/dev

Run:
terraform output

Next (Phase 03)

GitHub Actions: terraform fmt/validate/plan on PRs

Optional: require signed commits + branch protections
