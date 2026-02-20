resource "proxmox_virtual_environment_container" "ubuntu_container" {
  description = "Managed by Terraform"

  node_name = "Hades01"
  vm_id     = 1234

  cpu {
    cores = 1
  }
    memory {
      dedicated = 512
    }

  # newer linux distributions require unprivileged user namespaces
  unprivileged = true
  features {
    nesting = true
  }

  initialization {
    hostname = "terraform-provider-proxmox-ubuntu-container"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      password = random_password.ubuntu_container_password.result
      keys     = [tls_private_key.ubuntu_container_key.public_key_openssh]
    }
  }

  network_interface {
    name = "veth0"
  }

  disk {
    datastore_id = "local-lvm"
    size         = 4
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.alpine_lxc_img.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    type             = "alpine"
  }

  startup {
    order      = 3
    up_delay   = 60
    down_delay = 60
  }
}

resource "proxmox_virtual_environment_download_file" "alpine_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = "Hades01"
  url          = "http://download.proxmox.com/images/system/alpine-3.23-default_20260116_amd64.tar.xz"
}

resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "ubuntu_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}

output "ubuntu_container_public_key" {
  value = tls_private_key.ubuntu_container_key.public_key_openssh
}