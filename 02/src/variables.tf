###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "prefix" {
  type    = string
  default = "netology"
}

variable "project" {
  type    = string
  default = "develop"
}

variable "role" {
  type    = string
  default = "platform-web"
}

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 5
#}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}


###ssh vars

#variable "vms_ssh_root_key" {
# type        = string
# default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8hSq3x1m8WIuqKY5kuU70v6+h49Qh8lsr+5cZ6Ow84nxpsg8LTNjBTmFcROJ6kXRc/Eh/RWtCQLahFsZ8bmNseipqF8Jp87Y9ImL4czW3Ufhd50wFxeMFtZKH7zyFXE9y+cTmP8oosJml0XkllWh25/OT+Y0mxG08G7DF7eT0p9KLlUXne1Ezc1SY6Ncpuw0UVhyYTT9Qq8FFRI86CMxAXwooZ8E9PeLB4AUjlyqjHv6vwUa1GVWcuu3UTrFXz1hy/BgH1bWjgVdUr6P4FnAQdCxHE9B8FP6efOfBH1v9zdc0b5JxQg8J6O6BMeCw+A7POHtiSvkHjvwjksBZpXbMAGiU9t0V/OpilVHUnZqeEvkNUEbX6BHkcg6Zo2OwOgrHKDii3c01WT6ZTFbOx0bS3LmcLCXqkaZkqE5MQL6GEnMcWtib9O5URTbHmNgAYBij8eAOJQyjXbJ5vr+YBHpmbUZr9lmNSMkWNQk32nE6szS+7QhRzj8ziqjSJvtEKKM= admins@s1"
#  description = "ssh-keygen -t ed25519"
#}

variable "metadata" {
  type = map(object({
    serial-port-enable  = number
    ssh-keys            = string
  }))
  default = {
    metadata = {
      serial-port-enable = 1
      ssh-keys         = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8hSq3x1m8WIuqKY5kuU70v6+h49Qh8lsr+5cZ6Ow84nxpsg8LTNjBTmFcROJ6kXRc/Eh/RWtCQLahFsZ8bmNseipqF8Jp87Y9ImL4czW3Ufhd50wFxeMFtZKH7zyFXE9y+cTmP8oosJml0XkllWh25/OT+Y0mxG08G7DF7eT0p9KLlUXne1Ezc1SY6Ncpuw0UVhyYTT9Qq8FFRI86CMxAXwooZ8E9PeLB4AUjlyqjHv6vwUa1GVWcuu3UTrFXz1hy/BgH1bWjgVdUr6P4FnAQdCxHE9B8FP6efOfBH1v9zdc0b5JxQg8J6O6BMeCw+A7POHtiSvkHjvwjksBZpXbMAGiU9t0V/OpilVHUnZqeEvkNUEbX6BHkcg6Zo2OwOgrHKDii3c01WT6ZTFbOx0bS3LmcLCXqkaZkqE5MQL6GEnMcWtib9O5URTbHmNgAYBij8eAOJQyjXbJ5vr+YBHpmbUZr9lmNSMkWNQk32nE6szS+7QhRzj8ziqjSJvtEKKM= admins@s1"
    }
  }
}

