variable "description" {
  description = "Description of the virtual machine."
  type        = string
  default     = "Managed by Terraform"
}

variable "node_name" {
  description = "Proxmox node name where the VM will be created."
  type        = string
}

variable "vm_id" {
  description = "Unique VM ID in Proxmox."
  type        = number
}

variable "cores" {
  description = "Number of CPU cores assigned to the VM."
  type        = number
  default     = 1
}

variable "sockets" {
  description = "Number of CPU sockets assigned to the VM."
  type        = number
  default     = 1
}

variable "memory_dedicated" {
  description = "Dedicated memory for the VM in MB."
  type        = number
  default     = 512
}

variable "memory_floating" {
  description = "Floating memory for ballooning in MB."
  type        = number
}

variable "agent_enabled" {
  description = "Enable QEMU guest agent."
  type        = bool
  default     = false
}

variable "name" {
  description = "Hostname of the virtual machine."
  type        = string
}

variable "ipv4_address" {
  description = "IPv4 address in CIDR notation, for example 192.168.1.10/24."
  type        = string
}

variable "ipv4_gateway" {
  description = "IPv4 gateway address."
  type        = string
  default     = "192.168.100.1"
}

variable "ssh_keys" {
  description = "List of SSH public keys for the default user."
  type        = list(string)
  default     = []
}

variable "password" {
  description = "Password for the default user."
  type        = string
  sensitive   = true
}

variable "network_bridge" {
  description = "Proxmox bridge to attach the VM network device to."
  type        = string
}

variable "datastore_id" {
  description = "Datastore ID used for the VM disk."
  type        = string
}

variable "disk_size" {
  description = "Disk size for the VM, for example 20 or 20G depending on provider expectations."
  type        = number
}

variable "disk_discard" {
  description = "Enable discard/TRIM on the VM disk."
  type        = string
  default     = "on"
}

variable "disk_iothread" {
  description = "Enable IO thread for the VM disk."
  type        = bool
  default     = true
}

variable "disk_interface" {
  description = "Disk interface type, for example scsi0."
  type        = string
  default     = "scsi0"
}

variable "cloud_image_id" {
  description = "File ID of the cloud image to import as the VM disk."
  type        = string
}