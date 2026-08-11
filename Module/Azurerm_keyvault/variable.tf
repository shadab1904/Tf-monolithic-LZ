variable "keyvault_airtel" {
  type = map(any)
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}