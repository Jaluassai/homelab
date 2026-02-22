terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.96.0"
    }
  }
}

resource "proxmox_virtual_environment_container" "this" {
  description = var.description

  node_name = var.node_name
  vm_id     = var.vm_id

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  unprivileged = var.unprivileged

  features {
    nesting = var.nesting
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      password = var.password
      keys     = var.ssh_keys
    }
  }

  network_interface {
    name = var.network_name
  }

  disk {
    datastore_id = var.datastore_id
    size         = var.disk_size
  }

  operating_system {
    template_file_id = var.template_file_id
    type             = var.os_type
  }

  startup {
    order      = var.startup_order
    up_delay   = var.up_delay
    down_delay = var.down_delay
  }
}