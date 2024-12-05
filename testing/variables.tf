variable "aws_region" {
  type        = string
  description = "AWS Region the instance is launched in"
  default     = "us-east-1"
}

variable "aws_subnet" {
  description = "List of vectors of subnets and Availability Zones"
  type        = string
  default     = "subnet-03a4955fe22027b9b"
}

variable "tf_user" {
  type    = string
  default = "djh-ansible-testing"
}
### AMI
variable "instance_type" {
  type        = string
  description = "AWS type of instance"
  default     = "t2.xlarge"
}

# OS Options
#  rhel9
#  rhel8
#  rhel7
#  sles15sp2
#  ubuntu20
#  ubuntu18
#  centos8
#  centos7
#  rocky8
variable "os" {
  type        = string
  description = "AWS AMI OS"
  default     = "rhel9" 
}

variable "amis" {
  description = "List of RHEL OS images based on regions"
  type = map(map(object({
    ami  = string
    user = string
  })))
  default = {
    "us-east-1" = {
      "rhel9" = {
        ami = "ami-0a45c8b16782f3406"  # ami  = "ami-0a45c8b16782f3406"
        user = "ec2-user"
      }
    }
    "us-gov-west-1" = {
      "rhel8" = {
        ami  = "ami-0ac4e06a69870e5be"
        user = "ec2-user"
      }
      "rhel7" = {
        ami  = "ami-e9d5ec88"
        user = "ec2-user"
      }
      "sles15sp2" = {
        ami  = "ami-04e3d865"
        user = "ec2-user"
      }
      "ubuntu20" = {
        ami  = "ami-84556de5"
        user = "ubuntu"
      }
      "ubuntu18" = {
        ami  = "ami-bce9d3dd"
        user = "ubuntu"
      }
      "centos8" = {
        ami  = "ami-967158f7"
        user = "centos"
      }
      "centos7" = {
        ami  = "ami-bbba86da"
        user = "centos"
      }
      "rocky8" = {
        ami  = "ami-01c3e8e014e8b0c7a"
        user = "centos"
      }
    }
  }
}

variable "control_nodes" {
  type        = number
  description = "Number of RKE2 manager nodes"
  default     = 2
}

variable "worker_nodes" {
  type        = number
  description = "Number of RKE2 worker nodes"
  default     = 1
}

variable "extra_worker_nodes" {
  type        = number
  description = "Number of RKE2 worker nodes to add for idempotency tests"
  default     = 1
}

variable "ansible_user" {
  type        = string
  description = "Username used by Ansible to run remote configuration"
  default     = "ec2-user"
}

variable "GITHUB_RUN_ID" {
  type        = number
  default     = 0
}
