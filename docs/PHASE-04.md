# Phase 04 — CloudWatch Dashboard (Polish)

## Goal
Add a visual dashboard to demonstrate auto-heal behavior and traffic at a glance.

## What was added
- **CloudWatch Dashboard:** `autoheal-cloud-dev`
  - ALB RequestCount
  - Target 5XX errors
  - Healthy/Unhealthy host counts
  - ASG InService instances

## How to view
AWS Console → CloudWatch → Dashboards → **autoheal-cloud-dev** (Region: ap-south-1)

## Why it matters
Gives reviewers a quick, visual proof of self-healing and traffic patterns.
