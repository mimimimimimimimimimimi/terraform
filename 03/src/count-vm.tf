data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "web" {
  count        = var.instance_count
  name         = "web-${count.index + 1}"
  depends_on = [yandex_compute_instance.db]
  platform_id = var.platform_id
  resources {
    cores         = var.vms_resources["web_vm"].cores
    memory        = var.vms_resources["web_vm"].memory
    core_fraction = var.vms_resources["web_vm"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
