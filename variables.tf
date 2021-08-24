#
# Copyright (c) 2021 LabKey Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

variable "debug" {
  type        = bool
  default     = false
  description = "whether to increase verbosity of shell scripts or not"
}

variable "security_group_ids" {
  type        = list(string)
  description = "list of security groups to apply"
  default     = []
}

# variable "vpc_id" {
#   type        = string
#   default     = null
#   description = "id of the vpc within which to create the infrastructure"
# }

variable "keypair_name" {
  type        = string
  description = "name of existing keypair to use when creating EC2"
}

# variable "private_subnet_ids" {
#   type        = list(string)
#   description = "list of private subnet ids to use when creating vpc"
# }

# variable "public_subnet_ids" {
#   type        = list(string)
#   description = "list of public subnet ids to use when creating vpc"
# }

# variable "azs" {
#   description = "A list of availability zones in the region"
#   type        = list(string)
#   default     = []
# }

variable "subnet_id" {
  type        = string
  description = "subnet to create instances in"
}

variable "private_key_path" {
  type        = string
  description = "path to the ssh private key used for provisioning instances"
}

variable "install_script_repo_url" {
  type        = string
  description = "url of the install script repo"
  default     = "https://github.com/LabKey/install-script.git"
}

variable "install_script_repo_branch" {
  type        = string
  default     = null
  description = "(optional) branch of install script repo to chekout"
}