terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

variable "env_name" {
  description = "The environment name"
  type        = string
}

variable "zone" {
  description = "The zone for the subnet"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the subnet"
  type        = string
}

resource "yandex_vpc_network" "network" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.env_name}-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.cidr]
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
}

output "network_id" {
  value = yandex_vpc_network.network.id
}