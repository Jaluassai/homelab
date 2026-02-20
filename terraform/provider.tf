terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.96.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  api_token = var.proxmox_api_token_id

  ssh {
    agent = true
    username = var.PROXMOX_VE_USERNAME
    password = var.PROXMOX_VE_PASSWORD
  }

}