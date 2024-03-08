resource "local_file" "file_templatefile" {
  content = templatefile("${path.module}/file.tftpl",
  { 
    webservers = yandex_compute_instance.web
    databases  = yandex_compute_instance.db
    storage    = [yandex_compute_instance.storage]
  })
  filename = "${abspath(path.module)}/file.cfg"
}
