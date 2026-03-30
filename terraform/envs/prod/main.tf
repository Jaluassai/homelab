module "traefik" {
  source = "../../modules/lxc"

  node_name = "Hades01"
  vm_id     = 301
  hostname  = "treafik"

  cores  = 1
  memory = 512

  ipv4_address = "192.168.100.199/24"
  ipv4_gateway = "192.168.100.1"

  datastore_id = "local-lvm"
  disk_size    = 4

  template_file_id = proxmox_virtual_environment_download_file.lxc_img.id
  os_type          = "ubuntu"

  password = random_password.ubuntu_container_password.result
  ssh_keys = concat(
    [tls_private_key.ubuntu_container_key.public_key_openssh],
    values(var.ssh_public_keys)
  )

}

module "adgurd" {
  source = "../../modules/lxc"

  node_name = "Hades01"
  vm_id     = 302
  hostname  = "adguard"

  cores  = 1
  memory = 512

  ipv4_address = "192.168.100.39/24"
  ipv4_gateway = "192.168.100.1"

  datastore_id = "local-lvm"
  disk_size    = 4

  template_file_id = proxmox_virtual_environment_download_file.lxc_img.id
  os_type          = "ubuntu"

  password = random_password.adguard_container_password.result
  ssh_keys = concat([tls_private_key.adguard_container_key.public_key_openssh], values(var.ssh_public_keys))

}

module "docker01" {
  source = "../../modules/vm"

  node_name        = "Hades01"
  vm_id            = 401
<<<<<<< HEAD
  name             = "docker01"
=======
  name         = "docker01"
>>>>>>> 158d78f681d8031c40934c0cc389d553a8390a5b
  cores            = 2
  memory_floating  = 2048
  memory_dedicated = 2048
  network_bridge   = "vmbr0"
  ipv4_address     = "192.168.100.40/24"
  ipv4_gateway     = "192.168.100.1"
  datastore_id     = "local-lvm"
  disk_size        = 16
  disk_discard     = true
  cloud_image_id   = proxmox_virtual_environment_download_file.vm_img.id
  password         = random_password.docker01_container_password.result
  ssh_keys         = concat([tls_private_key.docker01_container_key.public_key_openssh], values(var.ssh_public_keys))
}