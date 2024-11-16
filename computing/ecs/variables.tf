variable "name" {
  type = string
  description = "Nombre de la ECS"
}

variable "admin_pass" {
  type = string
  description = "Clave de la ECS"
}

variable "enterprise_project_id" {
  type = string
  description = "ID del Enterprise project"
  default = "0"
}

variable "image_id"{
  type = string
  description = "ID de la imagen"
}

variable "flavor_id" {
  type = string
  description = "ID del flavor"
}

variable "security_group_ids" {
  type = list(string)
  description = "Lista de Ids de Security Groups"
}

variable "availability_zone" {
  type = string
  description = "Zona de disponibilidad (Opcional)"
  nullable = true
  default = null
}

variable "network_id" {
  type = list(object({
    uuid = string
  }))
  description = "Lista de Id(s) de la(s) subnet(s) de la(s) ECS(s)"
}

variable "system_disk" {
  type = object({
    type = string
    size = string
  })
  description = "Tipo y tamaño de disco de sistema"
}

variable "data_disks" {
  type = list(object({
    type = string
    size = string
  }))
  description = "Lista de tipo y tamaño de discos de datos. (Opcional)"
  nullable = true
  default = null
}