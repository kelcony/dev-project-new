###
variable "vpc-cidr" {
  type        = string
  description = "name of  vpc cidr"
  default     = "10.0.0.0/16"
}


variable "public-subnet1-cidr" {
  type        = string
  description = "name of  public subnet1 cidr"
  default     = "10.0.1.0/24"
}

variable "public-subnet2-cidr" {
  type        = string
  description = "name of  public subnet2 cidr"
  default     = "10.0.2.0/24"
}

variable "private-subnet1-cidr" {
  type        = string
  description = "name of  private subnet1 cidr"
  default     = "10.0.3.0/24"
}

variable "private-subnet2-cidr" {
  type        = string
  description = "name of  private subnet2 cidr"
  default     = "10.0.4.0/24"
}

variable "az1" {
  type        = string
  description = "name of  avaliabilty zone"
  default     = "eu-west-2a"
}

variable "az2" {
  type        = string
  description = "name of  avaliabilty zone"
  default     = "eu-west-2b"
}

variable "az3" {
  type        = string
  description = "name of  avaliabilty zone"
  default     = "eu-west-2c"
}


variable "az4" {
  type        = string
  description = "name of  avaliabilty zone"
  default     = "eu-west-2a"
}

variable "route-table" {
  type        = string
  description = "name of the route table"
  default     = "0.0.0.0/0"
}

variable "region" {
  type        = string
  description = "name of region"
  default     = "eu-west-2"
}
