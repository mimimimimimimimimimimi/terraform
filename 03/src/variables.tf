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

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web_vm = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
  }
}

variable "each_vm" {
  type = list(object({
    name          = string
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = [
    {
      name          = "main"
      cores         = 2
      memory        = 4
      core_fraction = 5
    },
    {
      name          = "replica"
      cores         = 4
      memory        = 2
      core_fraction = 20
    }
  ]
}

variable "disk_size" {
  type        = string
  default     = "1"
  description = "HDD volume for VM"
}

variable "instance_count" {
  type        = string
  default     = "2"
}

variable "disk_cont" {
  type        = string
  default     = "3"
}

variable "disk_type" {
  type        = string
  default     = "network-hdd"
}

variable "name_disk" {
  type        = string
  default     = "storage"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
}