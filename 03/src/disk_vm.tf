resource "yandex_compute_disk" "storage" {
  count = var.disk_cont
  name  = "disk${count.index + 1}"
  size  = var.disk_size
  type  = var.disk_type
}
 
resource "yandex_compute_instance" "storage" {
  name = var.name_disk
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic secondary_disk {
    for_each = yandex_compute_disk.storage
    content {
      disk_id     = secondary_disk.value.id
      device_name = secondary_disk.value.name
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
