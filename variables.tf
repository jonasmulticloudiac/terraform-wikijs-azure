variable "postgresql-admin-login" {
  type        = string
  description = "Login to authenticate to PostgreSQL Server"
  default = "adminroot"
  
}
variable "postgresql-admin-password" {
  type        = string
  description = "Password to authenticate to PostgreSQL Server"
  default = "Ar00t4dm!n" 
}
variable "postgresql-version" {
  type        = string
  description = "PostgreSQL Server version to deploy"
  default     = "11"
}
variable "postgresql-sku-name" {
  type        = string
  description = "PostgreSQL SKU Name"
  default     = "B_Gen5_1"
}
variable "postgresql-storage" {
  type        = string
  description = "PostgreSQL Storage in MB"
  default     = "5120"
}


variable "app" {
  type        = string
  description = "Nome da aplicacao"
  default     = "-jonaswiki"
}