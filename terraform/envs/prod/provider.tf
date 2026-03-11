terraform {
  required_version = ">= 1.14.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.96.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_api_url
  api_token = var.proxmox_api_token_id

  ssh {
    agent    = true
    username = var.PROXMOX_VE_USERNAME
    password = var.PROXMOX_VE_PASSWORD
  }
}