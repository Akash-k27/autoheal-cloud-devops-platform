# ☁️ AutoHeal Cloud — Self-Healing Secure DevOps Platform

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
**AutoHeal Cloud** is a self-healing, observable, and secure AWS DevOps platform — built with **Terraform**, **CloudWatch**, **SNS**, and **GitHub Actions CI**.  
It automates detection, alerting, and recovery of unhealthy EC2 instances using AWS native services.

---

## 📚 Table of Contents
- [Overview](#-overview)
- [Architecture Overview](#-architecture-overview)
- [Tech Stack](#-tech-stack)
- [Phases Implemented](#-phases-implemented)
- [Setup Instructions](#-setup-instructions)
- [CloudWatch Monitoring](#-cloudwatch-monitoring)
- [Future Enhancements](#-future-enhancements)
- [Contact](#-contact)

---

## 🧩 Overview
AutoHeal Cloud demonstrates **end-to-end DevOps practices** including:
- Infrastructure as Code (Terraform)
- CI/CD validation (GitHub Actions)
- Auto-healing infrastructure with ASG
- Cloud-native monitoring and alerting
- Documentation by phase for clarity

This project **detects and replaces failed EC2 instances** automatically through Auto Scaling Groups and triggers **SNS alerts** during failures.

---

## 🧭 Architecture Overview

> _High-level workflow of AutoHeal Cloud Platform_

```
Client → Application Load Balancer (HTTP:80)
              ↓
        Target Group (/health)
              ↓
    Auto Scaling Group (min=2, max=4)
          ├── EC2 Instance (Nginx + CloudWatch Agent)
          └── EC2 Instance (Nginx + Node Exporter)
```
## 🧭 Architecture Overview

### Phase 1 — Basic Self-Healing Infrastructure
![Phase 1](./docs/architecture-phase1-basic.png)
> Application Load Balancer routes traffic to EC2 instances in an Auto Scaling Group.  
> CloudWatch monitors instance health and triggers SNS email alerts when failures occur.

### Phase 3 — Monitoring Integration
![Phase 3](./docs/architecture-phase3-monitoring.png)
> Added Node Exporter for metrics collection.  
> CloudWatch Dashboards visualize instance health, latency, and target group performance.

### Phase 6 — Final AutoHeal Cloud Setup
![Phase 6](./docs/architecture-phase6-final.png)
> Complete setup with Terraform IaC, GitHub Actions CI/CD, ALB + ASG + EC2 (Node Exporters),  
> CloudWatch Dashboards, SNS alerts, and self-healing automation.

---

## ⚙️ Tech Stack

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

## 🧱 Phases Implemented

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

## ⚡ Setup Instructions

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
ASG automatically replaces the unhealthy instance 🎯  
You’ll receive SNS alerts via configured email.

---

## 📊 CloudWatch Monitoring
The deployment creates:
- **Dashboard:** `autoheal-cloud-dev`  
- **Alarms:** `autoheal-web-tg-unhealthy-hosts`, `autoheal-web-target-5xx`  
- **SNS Topic:** `autoheal-alerts`  
- **Metrics:**  
  - ALB `RequestCount`, `Target 5XX`
  - ASG `InServiceInstances`
  - TargetGroup `HealthyHostCount`, `UnHealthyHostCount`

---

## 🌐 Future Enhancements
- Integrate Prometheus & Grafana dashboard
- Add Lambda-based instance auto-tagging
- Enable S3 backend for Terraform state
- Include Jenkins CI/CD pipeline for modular deployments

---

## 👤 Author
**Akash K** — *AWS Certified Cloud Practitioner*  
🚀 DevOps Engineer | Terraform | AWS | CI/CD | Kubernetes | Docker  
📧 [akash.k.22204@gmail.com](mailto:akash.k.22204@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/akash-k-728a16207)  
🔗 [GitHub](https://github.com/Akash-k27)
