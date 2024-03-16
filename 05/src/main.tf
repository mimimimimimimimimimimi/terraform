terraform {
  backend "s3" {
  endpoint                    = "storage.yandexcloud.net"
  bucket                      = "tfstate-27"
  region                      = "ru-central1-a"
  key                         = "terraform.tfstate"
  skip_region_validation      = true
  skip_credentials_validation = true
  dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g4su1v8mollnks7dbt/etng8s48fhtg6o1e8b64"
  dynamodb_table              = "table716"
  }


#  backend "s3" {
#  endpoint   = "storage.yandexcloud.net"
#  bucket     = "tfstate-27"
#  region     = "ru-central1-a"
#  key        = "terraform.tfstate"
#  skip_region_validation      = true
#  skip_credentials_validation = true
#  }
}

variable "token" {
  description = "The Yandex.Cloud API token"
  type        = string
}

variable "cloud_id" {
  description = "The ID of your cloud"
  type        = string
}

variable "folder_id" {
  description = "The ID of your folder"
  type        = string
}

resource "yandex_vpc_network" "develop" {
  name = "develop"
}

resource "yandex_vpc_subnet" "develop" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_security_group" "test_develop" {
  name       = "test_develop"
  network_id = yandex_vpc_network.develop.id
  folder_id  = var.folder_id
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4d05fab828b1fcae16556a4d167134efca2fccf2"
  env_name       = "marketing"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev.subnet_id]
  security_group_ids = [yandex_vpc_security_group.test_develop.id]
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  labels = {
    project = "marketing"
  }
}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4d05fab828b1fcae16556a4d167134efca2fccf2"
  env_name       = "analytics"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev.subnet_id]
  security_group_ids = [yandex_vpc_security_group.test_develop.id]
  instance_name  = "vm"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = false

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  labels = {
    project = "analytics"
  }
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yaml")

  vars = {
    ssh_public_key = file("~/.ssh/id_rsa.pub")
  }
}

module "vpc_dev" {
  source   = "./vpc"
  env_name = "test_develop"
  zone     = "ru-central1-a"
  cidr     = "10.0.1.0/24"
}