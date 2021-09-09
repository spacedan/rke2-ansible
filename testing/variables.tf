variable "aws_region" {
  type        = string
  description = "AWS Region the instance is launched in"
  default     = "us-gov-west-1"
}

variable "aws_subnet" {
  description = "List of vectors of subnets and Availability Zones"
  type        = string
  default     = "subnet-0523d8467cf8e5cec"
}

variable "tf_user" {
  type    = string
  default = "rke2-ansible-github-actions"
}

### AMI
variable "instance_type" {
  type        = string
  description = "AWS type of instance"
  default     = "t2.xlarge"
}

# OS Options
#  rhel-8.4
#  rhel-7.8
#  sles-15-SP2
#  ubuntu-20.04
#  ubuntu-18.04
#  centos-8.2
#  centos-7.8
variable "os" {
  type        = string
  description = "AWS AMI OS"
  default     = "sles-15-SP2"
}

variable "amis" {
  description = "AWS images and needed users"
  type = map(map(object({
    ami  = string
    user = string
  })))
  default = {
    "us-gov-west-1" = {
      "rhel-8.4" = {
        ami  = "ami-0ac4e06a69870e5be"
        user = "ec2-user"
      }
      "rhel-7.8" = {
        ami  = "ami-e9d5ec88"
        user = "ec2-user"
      }
      "sles-15-SP2" = {
        ami  = "ami-04e3d865"
        user = "ec2-user"
      }
      "ubuntu-20.04" = {
        ami  = "ami-84556de5"
        user = "ubuntu"
      }
      "centos-8.2" = {
        ami  = "ami-967158f7"
        user = "centos"
      }
      "centos-7.8" = {
        ami  = "ami-bbba86da"
        user = "centos"
      }
    }
  }
}

variable "control_nodes" {
  type        = number
  description = "Number of RKE2 manager nodes"
  default     = 3
}

variable "worker_nodes" {
  type        = number
  description = "Number of RKE2 worker nodes"
  default     = 3
}

variable "GITHUB_RUN_ID" {}
