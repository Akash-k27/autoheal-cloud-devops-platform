# ‚òÅÔ∏è AutoHeal Cloud ‚Äî Self-Healing Secure DevOps Platform

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Build Status](https://github.com/Akash-k27/autoheal-cloud-devops-platform/actions/workflows/tf-ci.yml/badge.svg)](https://github.com/Akash-k27/autoheal-cloud-devops-platform/actions)
![Terraform](https://img.shields.io/badge/Terraform-Yes-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Deployed-232F3E?logo=amazon-aws)
![CloudWatch](https://img.shields.io/badge/Monitoring-CloudWatch-FF9900?logo=amazonaws)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker)
![Prometheus](https://img.shields.io/badge/Prometheus-Metrics-E6522C?logo=prometheus)
![Grafana](https://img.shields.io/badge/Grafana-Dashboard-F46800?logo=grafana)

---

### Short Summary  
**AutoHeal Cloud** is a self-healing, observable, and secure AWS DevOps platform ‚Äî built with **Terraform**, **CloudWatch**, **SNS**, and **GitHub Actions CI**.  
It automates detection, alerting, and recovery of unhealthy EC2 instances using AWS native services.

---

## Ì≥ö Table of Contents
- [Overview](#-overview)
- [Architecture Overview](#-architecture-overview)
- [Tech Stack](#-tech-stack)
- [Phases Implemented](#-phases-implemented)
- [Setup Instructions](#-setup-instructions)
- [CloudWatch Monitoring](#-cloudwatch-monitoring)
- [Future Enhancements](#-future-enhancements)
- [Contact](#-contact)

---

## Ì∑© Overview
AutoHeal Cloud demonstrates **end-to-end DevOps practices** including:
- Infrastructure as Code (Terraform)
- CI/CD validation (GitHub Actions)
- Auto-healing infrastructure with ASG
- Cloud-native monitoring and alerting
- Documentation by phase for clarity

This project **detects and replaces failed EC2 instances** automatically through Auto Scaling Groups and triggers **SNS alerts** during failures.

---

## Ì∑≠ Architecture Overview

> _High-level workflow of AutoHeal Cloud Platform_

```
Client ‚Üí Application Load Balancer (HTTP:80)
              ‚Üì
        Target Group (/health)
              ‚Üì
    Auto Scaling Group (min=2, max=4)
          ‚îú‚îÄ‚îÄ EC2 Instance (Nginx + CloudWatch Agent)
          ‚îî‚îÄ‚îÄ EC2 Instance (Nginx + Node Exporter)
```

---

## ‚öôÔ∏è Tech Stack

| Category | Tools & Services |
|-----------|------------------|
| **Infrastructure** | Terraform (modular design) |
| **Cloud Platform** | AWS EC2, ALB, ASG, IAM, SNS, CloudWatch |
| **Monitoring & Alerts** | CloudWatch Alarms, Dashboards, SNS |
| **Automation** | Bash (user-data), AWS CLI |
| **CI/CD** | GitHub Actions (fmt + validate workflow) |
| **Languages** | HCL, Bash, JSON |
| **Future Add-ons** | Prometheus, Grafana, Lambda-based automation |

---

## Ì∑± Phases Implemented

| Phase | Description |
|--------|-------------|
| **01** | EC2 Auto-Heal setup (ASG + ALB + health checks) |
| **02** | Terraform outputs + CloudWatch alarms |
| **03** | GitHub Actions CI (fmt + validate) |
| **04** | CloudWatch dashboard visualization |
| **05** | SNS alerting and failure recovery test |
| **06** | Prometheus Node Exporter for metrics *(optional)* |

> Each phase is documented in the `/docs` directory  
(e.g. `docs/PHASE-01.md`, `docs/PHASE-05.md`)

---

## ‚ö° Setup Instructions

```bash
# Clone the repository
git clone https://github.com/Akash-k27/autoheal-cloud-devops-platform.git
cd autoheal-cloud-devops-platform/infra/terraform/envs/dev

# Initialize and deploy infrastructure
terraform init
terraform apply -auto-approve

# Verify the health endpoint
curl -s http://$(terraform output -raw alb_dns_name)/health
```

### To simulate auto-healing
```bash
aws autoscaling terminate-instance-in-auto-scaling-group   --region ap-south-1   --instance-id <id>   --should-decrement-desired-capacity false
```
ASG automatically replaces the unhealthy instance ÌæØ  
You‚Äôll receive SNS alerts via configured email.

---

## Ì≥ä CloudWatch Monitoring
The deployment creates:
- **Dashboard:** `autoheal-cloud-dev`  
- **Alarms:** `autoheal-web-tg-unhealthy-hosts`, `autoheal-web-target-5xx`  
- **SNS Topic:** `autoheal-alerts`  
- **Metrics:**  
  - ALB `RequestCount`, `Target 5XX`
  - ASG `InServiceInstances`
  - TargetGroup `HealthyHostCount`, `UnHealthyHostCount`

---

## Ìºê Future Enhancements
- Integrate Prometheus & Grafana dashboard
- Add Lambda-based instance auto-tagging
- Enable S3 backend for Terraform state
- Include Jenkins CI/CD pipeline for modular deployments

---

## Ì±§ Author
**Akash K** ‚Äî *AWS Certified Cloud Practitioner*  
ÔøΩÔøΩ DevOps Engineer | Terraform | AWS | CI/CD | Kubernetes | Docker  
Ì≥ß [akash.k.22204@gmail.com](mailto:akash.k.22204@gmail.com)  
Ì¥ó [LinkedIn](https://www.linkedin.com/in/akash-k-728a16207)  
Ì¥ó [GitHub](https://github.com/Akash-k27)

