# Phase 01 — EC2 Auto-Heal (ASG + ALB) — Dev

## Goal
Stand up a minimal, self-healing web service on AWS using:
- **Application Load Balancer (ALB)** with `/health` checks
- **Auto Scaling Group (ASG)** that replaces unhealthy instances
- **Launch Template** with user-data that installs Nginx and serves `/` and `/health`

## What we built

Client ──HTTP:80──> ALB ──> Target Group (HTTP /health)
│
└── Auto Scaling Group (min=2, max=4)
└── EC2 instances (Launch Template + user-data)

## Key files (this repo)
- `infra/terraform/modules/asg-service/userdata.sh`  
  Boots Nginx and serves:
  - `/` → `OK`
  - `/health` → `OK` (used by ALB health checks)
- `infra/terraform/modules/asg-service/main.tf`  
  Terraform for **Security Group, ALB, Target Group, Listener, Launch Template, ASG**.
- `infra/terraform/envs/dev/main.tf`  
  Wires the module to the default VPC/subnets; fetches latest AL2023 AMI.

## Commands used
```bash
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"



How auto-heal works

ALB health checks hit /health on each instance.

If an instance fails health checks, Target Group marks it unhealthy and ASG replaces it automatically.

User-data ensures Nginx starts on every boot.

How to test

Get ALB DNS:
aws elbv2 describe-load-balancers --names autoheal-web-alb --region ap-south-1 --query 'LoadBalancers[0].DNSName' --output text

Open in browser:
http://<ALB-DNS>/
http://<ALB-DNS>/health

Simulate failure on one instance (via SSH):
sudo systemctl stop nginx
Watch ALB mark it unhealthy and ASG replace it.

Notes

Region: ap-south-1

Instance type: t3.micro

Using default VPC for demo

Later phases: custom VPC, CloudWatch alarms, CI/CD

Next (Phase 02)

Add Terraform outputs (ALB DNS)

Add CloudWatch alarms & dashboards

Add CI checks for Terraform fmt/validate
