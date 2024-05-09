variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region for the hosted infrastructure."
  type        = string
}

variable "random_pet" {
  default     = 1
  description = "The amount of names to be used as unique identifiers."
  type        = number
}
