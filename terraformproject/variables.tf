/*variable "aws_key_name" {
         default = "devopskeys.pem"
}*/

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        eu-west-1 = "ami-f1810f86" # ubuntu 14.04 LTS
    }
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "AZs in this region to use"
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  type = list(string)
}

variable "public_subnet_count" {
  description = "Number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets."
  type        = number
  default     = 2
}

variable "public_subnet_cidr" {
  description = "Available cidr blocks for public subnets."
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnet_cidr" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "instance_count" {
  description = "Number of instances to provision."
  type        = number
  default     = 2
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    name        = "devops",
    project     = "project-synops",
    environment = "dev"
    terraform   = "true"
  }
}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type."
  type        = string
  default     = "t2.micro"
}