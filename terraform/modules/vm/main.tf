terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.96.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  description = var.description

  node_name = var.node_name
  vm_id     = var.vm_id
  name      = var.name

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = "x86-64-v2-AES" # recommended for modern CPUs
  }

  memory {
    dedicated = var.memory_dedicated
    floating  = var.memory_floating
    # set equal to dedicated to enable ballooning
  }


  agent {
    enabled = var.agent_enabled
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order = "3"
  }

  initialization {

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      keys     = var.ssh_keys
      password = var.password
      username = "ubuntu"
    }

    #user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }

  network_device {
    bridge = var.network_bridge
  }
  #tags        = ["terraform", "ubuntu"]
  disk {
    datastore_id = var.datastore_id
    size         = var.disk_size
    discard      = var.disk_discard
    iothread     = var.disk_iothread
    interface    = var.disk_interface
    import_from  = var.cloud_image_id

  }

  operating_system {
    type = "l26"
  }

  tpm_state {
    version = "v2.0"
  }

  lifecycle {
    ignore_changes = [import_from]
  }

}
