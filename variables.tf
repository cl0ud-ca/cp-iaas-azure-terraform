# company name (Will be used as a prefix for management and gateways)
variable "company" {
  type        = string
  description = "Company Name"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
  default     = "West US 2"
}

# Gateway VNET
variable "gw-network-vnet-cidr" {
  type        = string
  description = "Gateway VNET"
}

# Gateway Subnet
variable "gw-network-subnet-cidr" {
  type        = string
  description = "Gateway Subnet"
}

# Gateway External Private IP
variable "gw-external-private-ip" {
  type        = string
  description = "Gateway Subnet"
}


# Gateway INTERNAL Subnet
variable "gw-network-internal-subnet-cidr" {
  type        = string
  description = "Gateway Subnet"
}

# Gateway Intertal Private IP
variable "gw-internal-private-ip" {
  type        = string
  description = "Gateway Subnet"
}

# username
variable "username" {
  type        = string
  description = "Username"
}

# password
variable "password" {
  type        = string
  description = "Password"
}

# environment
variable "environment" {
  type        = string
  description = "Staging or Production"
}

# SIC Key
variable "sic_key" {
  type        = string
  description = "Username"
}

# MGMT Name
variable "mgmt_name" {
  type        = string
  description = "Management name for autoprovision"
}

# Template Name
variable "cme_template" {
  type        = string
  description = "Management name for autoprovision"
}
