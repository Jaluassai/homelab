output "id" {
  value = proxmox_virtual_environment_vm.this.id
}

output "hostname" {
  value = var.hostname
}

output "ip_address" {
  value = proxmox_virtual_environment_vm.this.initialization[0].ip_config[0].ipv4[0].address
}