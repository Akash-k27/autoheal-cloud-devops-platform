# ‚òÅÔ∏è AutoHeal Cloud ‚Äî DevOps Platform (Terraform + AWS)

## Ì≥ñ Overview
**AutoHeal Cloud** is a modular, production-grade DevOps project demonstrating:
- EC2 **Auto-Healing Web Service** (ASG + ALB)
- Terraform **Infrastructure as Code**
- **CloudWatch Monitoring**
- **GitHub Actions CI/CD**
- GPG **Signed Commits** (verified)

Built end-to-end by **Akash K**, AWS Certified Cloud Practitioner & DevOps Engineer.

---

## ÌøóÔ∏è Architecture
Client ‚Üí ALB (HTTP :80 /health)
‚Üì
Target Group
‚Üì
Auto Scaling Group
‚Ü≥ EC2 Instances (Launch Template + Nginx User Data)



- Load Balancer health checks `/health`
- Auto Scaling Group replaces unhealthy instances
- CloudWatch alarms for target health & 5XX errors
- CI workflow validates every Terraform change

---

## Ì∑± Tech Stack
- **AWS:** EC2, ALB, ASG, CloudWatch
- **Terraform:** IaC modules for infra automation
- **CI/CD:** GitHub Actions
- **Monitoring:** CloudWatch alarms + future Prometheus/Grafana integration

---

## Ì∑© Repository Phases
| Phase | Description |
|--------|-------------|
| [Phase 01](docs/PHASE-01.md) | EC2 Auto-Heal (ASG + ALB) |
| [Phase 02](docs/PHASE-02.md) | Outputs & CloudWatch Monitoring |
| [Phase 03](docs/PHASE-03.md) | CI/CD Workflow Setup |
| Phase 04 | Final polish + optional dashboards |

---

## Ì∫Ä Usage
```bash
cd infra/terraform/envs/dev
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply "tfplan"
ÔøΩÔøΩ‚ÄçÌ≤ª Author
Akash K
DevOps Engineer | AWS Certified Cloud Practitioner
Ì≤º LinkedIn
Ì≥Ç GitHub

