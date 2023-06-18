# Proxmox Full-Clone
# ---
# Create a new VM from a clone


variable "target_node" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "ciuser" {
  type = string
  default = "absentadmin"
}

variable "cipassword" {
  type = string
  default = ""
  
}

variable "tags" {
  type = string
  default = "terraform,automation"
}
variable "sshkey" {
  type = string
  default = ""
}
variable "ipconfig0" {
  type = string
}

variable "disk_size" {
  type = string
  default = "10G"
}

variable "network_tag" {
  type = number
  default = 5
}
variable "pool" {
  type = string
  default = "Unassigned"
}

variable "vm_description" {
  type = string
  default = "Created by Terraform"
}
  
variable "cloneTemplate" {
  type = string
  default = "UbuntuTemp"
}
  
variable "vmid" {
  type = number
  default = 0
}
resource "proxmox_vm_qemu" "absentvm" {

  target_node = var.target_node
  name        = var.vm_name
  desc        = var.vm_description
  onboot      = true
  vmid        = var.vmid
  tags  = var.tags
  clone = var.cloneTemplate
  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores   = var.cores
  sockets = 1
  cpu     = "host"

  # VM Memory Settings
  memory = var.memory

  pool = var.pool
  # VM Network Settings
  network {
    bridge = "vmbr0"
    model  = "virtio"
    tag = var.network_tag
  }
 vga {
    type = "serial0"
  } 
 #  create a disk with the size of 10GB
  disk {
    size = var.disk_size
    type = "scsi"
    storage = "local-lvm"
    cache = "writeback"
    iothread = 0
  }
  # VM Cloud-Init Settings
  os_type = "cloud-init"

  # (Optional) IP Address and Gateway
  ipconfig0  = var.ipconfig0
  
  # (Optional) Default User and Password
  ciuser     = var.ciuser
  cipassword = var.cipassword
  
  # (Optional) Add your SSH KEY
  #sshkeys = var.sshkey


}
