resource "proxmox_virtual_environment_download_file" "lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = "Hades01"
  url          = "http://download.proxmox.com/images/system/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  overwrite_unmanaged = true
  #url          = "http://download.proxmox.com/images/system/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
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


resource "random_password" "adguard_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "adguard_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}