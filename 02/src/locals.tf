locals {
  vm_platform_name = "${var.prefix}-${var.project}-${var.role}"
  vm_db_name = "${var.prefix_db}-${var.project_db}-${var.role_db}"
}