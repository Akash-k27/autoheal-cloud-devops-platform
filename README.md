# AutoHeal Cloud — Self-Healing Secure DevOps Platform

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Build Status](https://github.com/Akash-k27/autoheal-cloud-devops-platform/actions/workflows/build.yml/badge.svg)](https://github.com/Akash-k27/autoheal-cloud-devops-platform/actions)
[![Terraform](https://img.shields.io/badge/Terraform-Yes-623CE4?logo=terraform)]()
[![AWS](https://img.shields.io/badge/AWS-Deployed-232F3E?logo=amazon-aws)]()
[![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?logo=kubernetes)]()
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker)]()
[![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-D24939?logo=jenkins)]()

Short: AutoHeal Cloud is a self-healing, secure, and observable multi-tier AWS platform built with Terraform, EKS, Jenkins, and Lambda automation.

## 📚 Table of Contents
- [Overview](#autoheal-cloud--self-healing-secure-devops-platform)
- [Architecture](#-architecture-overview)
- [Tech Stack](#-tech-stack)
- [Setup Instructions](#-setup-instructions)
- [Screenshots](#-screenshots)
- [Contact](#-contact)
- [Goals](#goals)


## 🧩 Overview
AutoHeal Cloud is a self-healing, secure, and observable multi-tier AWS platform.
It demonstrates end-to-end DevOps practices — Infrastructure-as-Code, CI/CD automation, 
cloud security, monitoring, and cost-optimization — built with Terraform, EKS, Jenkins, and AWS Lambda.


## What this repo contains
- infra/        — Terraform for VPC, EKS, RDS, S3, IAM
- app/          — Django backend (Dockerized) + frontend
- cicd/         — Jenkinsfiles, Helm charts
- monitoring/   — Prometheus, Grafana, ELK configs
- automation/   — Lambdas for auto-heal & cost reporting
- security/     — Cloud Custodian & OPA policies
- docs/         — diagrams, screenshots, how-to

## Quick start (dev machine)
1. Clone repo
2. Install AWS CLI, Terraform, Docker (see docs/installation.md)
3. Configure AWS profile: `aws configure --profile autoheal`
4. See `/docs/getting-started.md` for step-by-step.

## Goals
- Self-healing: detect & auto-recover unhealthy pods/instances
- DevSecOps: scanning, policy enforcement, auto-remediation
- Observability: Prometheus/Grafana + ELK + CloudWatch


---

## 🧭 Architecture Overview

> _A high-level view of AutoHeal Cloud’s components and flow._

![Architecture Diagram](./docs/architecture.png)

**Components:**
- **Terraform** — Infrastructure as Code for AWS (VPC, EKS, RDS, S3, IAM)
- **Kubernetes (EKS)** — Hosts the application & monitoring stack
- **Jenkins CI/CD** — Automates build, test, deploy pipelines
- **AWS Lambda** — Auto-healing & cost-optimization bots
- **CloudWatch, Prometheus, Grafana, ELK** — Full observability suite
- **Cloud Custodian / OPA** — Security & compliance enforcement


---

## ⚙️ Tech Stack

| Category | Tools & Technologies |
|-----------|----------------------|
| **Cloud Platform** | AWS (EC2, EKS, Lambda, RDS, S3, CloudWatch, IAM, Route 53) |
| **Infrastructure as Code** | Terraform, Helm |
| **CI/CD & DevOps** | Jenkins, GitHub Actions, Docker |
| **Security & Compliance** | IAM, Cloud Custodian, OPA, Trivy, SonarQube |
| **Monitoring & Observability** | Prometheus, Grafana, ELK Stack |
| **Automation** | Python (boto3, Lambda), Bash |
| **Networking & Architecture** | VPC, NACLs, Load Balancers, VPN |


---

## 📸 Screenshots

| Description | Screenshot |
|--------------|-------------|
| Grafana Dashboard | ![Grafana Dashboard](./docs/grafana-dashboard.png) |
| Jenkins Pipeline | ![Jenkins Pipeline](./docs/jenkins-pipeline.png) |
| Lambda Logs | ![Lambda Logs](./docs/lambda-logs.png) |


---

## 📬 Contact
**Akash K**  
DevOps Engineer | AWS Certified | Cloud & Automation Enthusiast  
📧 akash.k.22204@gmail.com  
🌐 [LinkedIn](https://www.linkedin.com/in/akash-k-728a16207) | [GitHub](https://github.com/Akash-k27)
