###cloud vars
#variable "vm_db_instance_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#}

variable "prefix_db" {
  type    = string
  default = "netology"
}

variable "project_db" {
  type    = string
  default = "develop"
}

variable "role_db" {
  type    = string
  default = "platform-db"
}

#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#}

#ariable "vm_db_memory" {
#  type        = number
#  default     = 2
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#}
