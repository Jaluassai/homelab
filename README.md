# homelab
Homelab repository for learning Infrastructure as Code (IaC), automation, and CI/CD.

This repository reproduces my local infrastructure running on a mini PC (R2400ge, 32 GB RAM). It is a playground for experimenting with provisioning, configuration management, and automated deployments.

Goals
- Recreate a realistic home infrastructure using reproducible, versioned IaC.
- Learn and document provisioning with Terraform, initial provisioning with Cloud-Init, and configuration with Ansible.
- Build CI/CD pipelines for automated container deployments and lifecycle management.

Key technologies
- Terraform — provision virtual machines and containers.
- Cloud-Init — perform initial instance configuration and bootstrap tasks.
- Ansible — configure services, install packages, and apply system-level changes.
- Docker (or other container runtimes) — run services in containers.
- Caddy — example reverse proxy / static file server used in this setup.


