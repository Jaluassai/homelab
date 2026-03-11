variable "proxmox_api_url" {}
variable "proxmox_api_token_id" {}

variable "PROXMOX_VE_USERNAME" {
  sensitive = true
  type        = string
}

variable "PROXMOX_VE_PASSWORD" {
  sensitive = true
  type        = string
}

# variable "proxmox_api_token_secret" {
#   description = "api token secret"
#   type        = string
#   sensitive   = true
# }

variable "ssh_public_keys" {
  description = "Map of SSH public keys to inject into container"
  type        = map(string)
  default     = {}
  sensitive   = true
}