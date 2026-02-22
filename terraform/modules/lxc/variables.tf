variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "node_name" { type = string }
variable "vm_id" { type = number }

variable "hostname" { type = string }

variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 512
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "nesting" {
  type    = bool
  default = true
}

variable "ipv4_address" {
  type    = string
  default = "dhcp"
}

variable "ipv4_gateway" {
  type = string
  default = null
}

variable "password" {
  type      = string
  sensitive = true
}

variable "ssh_keys" {
  type      = list(string)
  sensitive = true
}

variable "network_name" {
  type    = string
  default = "eth0"
}

variable "datastore_id" { type = string }

variable "disk_size" { type = number }

variable "template_file_id" { type = string }

variable "os_type" { type = string }

variable "startup_order" {
  type    = number
  default = 3
}

variable "up_delay" {
  type    = number
  default = 60
}

variable "down_delay" {
  type    = number
  default = 60
}
