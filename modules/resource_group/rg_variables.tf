variable "location" {
   description = "This is the location to deploy resources"
}

variable "env" {
   description = "Productive environment type. Possible values: pro, pre, dev, int, qa, dr"
}
variable "client" {
   description = "The name of the client"
}

variable "rg" {

   description = "This is the resource group name under the objects will be created"
}

variable "tags" {
  
}