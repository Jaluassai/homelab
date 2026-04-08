output "caddy_id" {
  value = module.caddy.id
}

output "caddy_hostname" {
  value = module.caddy.hostname
}

output "caddy_ip" {
  value = module.caddy.ip_address
}

output "caddy_container_password" {
  value     = random_password.caddy_container_password.result
  sensitive = true
}

# output "adguard_id" {
#   value = module.adgurd.id
# }

# output "adguard_hostname" {
#   value = module.adgurd.hostname
# }

# output "adguard_ip" {
#   value = module.adgurd.ip_address
# }

# output "adguard_container_password" {
#   value     = random_password.adguard_container_password.result
#   sensitive = true
# }

output "debug_caddy_ssh_keys_count" {
  value = length(concat(
    [tls_private_key.caddy_container_key.public_key_openssh],
    values(var.ssh_public_keys)
  ))
  sensitive = true
}

output "debug_var_ssh_public_keys_count" {
  value     = length(var.ssh_public_keys)
  sensitive = true
}