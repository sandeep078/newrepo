variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-6871a115"
    us-west-2 = "ami-32cf7b4a"
    eu-west-1 = "ami-844e0bf7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

data "aws_availability_zones" "available" {}

variable "statistic" {
  type        = "string"
  description = "The statistic to apply to the alarm's associated metric. Valid values are 'SampleCount', 'Average', 'Sum', 'Minimum' and 'Maximum'"
  default     = "Average"
}

variable "valid_statistics" {
  type = "map"

  default = {
    Average     = "70"
    Maximum     = "60"
    Minimum     = "30"
    SampleCount = "2"
    Sum         = "1    "
  }
}

variable "cidrs" {
  type = "list"
  default = [ "10.0.3.0/16",
     "10.0.4.0/16",
]
}
