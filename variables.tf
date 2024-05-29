variable "bucket_name" {
  description = "Nombre del s3 Bucket"
  type        = string
}

variable "bucket_artifacts" {
  description = "Nombre del bucket de Artefactos"
  type        = string
}

variable "ruta_landing" {
  description = "El path de contruccion del proyecto"
  type        = string
}

variable "repository" {
  description = "link del repositorio"
  type = string
}

variable "branch" {
  description = "Rama principal"
  type = string
}

variable "conectionBitbucket" {
  description = "Conexcion a bitbucket"
  type = string
}

variable "proyectName" {
  description = "Nombre de proyecto codebuild"
  type = string
}