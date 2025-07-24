variable "endpoint" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "image_id" {
  type = number
}

variable "template_id" {
  type = number
}
