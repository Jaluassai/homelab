output "traefik_id" {
  value = module.traefik.id
}

output "traefik_hostname" {
  value = module.traefik.hostname
}

output "traefik_ip" {
  value = module.traefik.ip_address
}

output "traefik_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}

output "adguard_id" {
  value = module.adgurd.id
}

output "adguard_hostname" {
  value = module.adgurd.hostname
}

output "adguard_ip" {
  value = module.adgurd.ip_address
}

output "adguard_container_password" {
  value     = random_password.adguard_container_password.result
  sensitive = true
}