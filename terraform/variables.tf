variable "vpc_id" {
  description = "The VCP ID"
  type        = string
  default     = "vpc-0952c9f58d9d8756f"
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}