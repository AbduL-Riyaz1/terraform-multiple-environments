variable "project" {
  default = "expense"
}
variable "environment" {
  
}
variable "instances" {
  default = ["mysql", "backend", "frontend"]
 
}

variable "zone_id" {
    default = "Z08924832RQM97SFT5BZF"
  
}

variable "domain_name" {
  default = "ardev.space"
}

variable "comman_tags" {
  type = map
  default = {
    Project = "expense"
  }
}