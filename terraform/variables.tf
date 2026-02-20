variable proxmox_api_url {
    description = "api url"
    type = string
    sensitive = false
}

variable proxmox_api_token_id {
    description = "api token id"
    type = string
    sensitive = true
}

variable proxmox_api_token_secret {
    description = "api token secret"
    type = string
    sensitive = true
}

variable PROXMOX_VE_USERNAME {
    description = "username for terraform account"
    type = string
    sensitive = true
}

variable PROXMOX_VE_PASSWORD {
    description = "passwd for terraform account"
    type = string
    sensitive = true
}

variable "basic_account" {
  description = "Username for the VM user"
  type        = string
}

variable "secret_password" {
  description = "Password for the VM user"
  type        = string
  sensitive   = true
}

variable "ssh_public_keys" {
  description = "Map of SSH public keys"
  type        = map(string)
  default     = {}
  sensitive = true
}
