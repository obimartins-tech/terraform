variable "aws_region" {
  description = "AWS region used for the classroom lab"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "EC2 instance type for the lab"
  type        = string
  default     = "t3.micro"
}
variable "project_name" {
  description = "Name prefix for lab resources"
  type        = string
  default     = "ei-week8"
}