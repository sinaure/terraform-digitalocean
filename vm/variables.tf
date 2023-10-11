variable "image" {
  type = string
  default = "debian-12-x64"
}

variable "size" {
  type = string
  default = "s-2vcpu-4gb"
}

variable "name" {
  type = string
  default = "ynov"
}

variable "init_script" {
  type = string
  default = "scripts/init-script.sh"
}