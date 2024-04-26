# ---------------- root ---------------------
variable "region" {
  type    = string
  default = "us-east-2"
}

variable "Environment" {
  type    = string
  default = "Dev"
}

variable "Service" {
  type    = string
  default = "mentorHub"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-2a", "us-east-2b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}