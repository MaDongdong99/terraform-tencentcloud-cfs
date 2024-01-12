#auto snapshot policy
variable "auto_snapshot_policies" {
  type = any
  default = {}
}

#Access Group
variable "cfs_access_group_name" {
  type = string
  description = "Name of the access group, and max length is 64."
}

variable "cfs_access_group_description" {
  type = string
  default = "description"
  description = "Description of the access group, and max length is 255."
}

#Access Rule
variable "auth_client_ip" {
  type    = list(string)
  default = ["10.0.0.1"]
  description = "A single IP or a single IP address range such as 10.1.10.11 or 10.10.1.0/24 indicates that all IPs are allowed. Please note that the IP entered should be CVM's private IP."
}

variable "priority" {
  type    = list(number)
  default = [1]
  description = "The priority level of rule. Valid value ranges: (1~100). 1 indicates the highest priority."
}

variable "rw_permission" {
  type    = list(string)
  default = ["RO"]
  description = "Read and write permissions. Valid values are RO and RW. and default is RO."
}

variable "user_permission" {
  type    = list(string)
  default = ["no_root_squash"]
  description = "The permissions of accessing users. Valid values are all_squash, no_all_squash, root_squash and no_root_squash. and default is root_squash. all_squash indicates that all access users are mapped as anonymous users or user groups; no_all_squash indicates that access users will match local users first and be mapped to anonymous users or user groups after matching failed; root_squash indicates that map access root users to anonymous users or user groups; no_root_squash indicates that access root users keep root account permission."
}

variable "cfs_map" {
  type = any
  default = {}
  description = "cfs map to create. If cfs_name is not set, key will be cfs_name. They all bind to the same cfs_access_group"
}

// The variables below is to explain cfs_map keys, they are not used
variable "availability_zone" {
  type = string
  default = ""
  description = "ForceNew. The available zone that the file system locates at."
}

variable "vpc_id" {
  type = string
  default = ""
  description = "ForceNew. ID of a VPC network."
}

variable "subnet_id" {
  type = string
  default = ""
  description = "ForceNew. ID of a subnet."
}

#cfs
variable "cfs_name" {
  type = string
  default = ""
  description = "Name of a file system."
}

variable "protocol" {
  type = string
  default = "NFS"
  description = "ForceNew. File system protocol. Valid values: NFS, CIFS, TURBO. If this parameter is left empty, NFS is used by default. For the Turbo series, you must set this parameter to TURBO."
}

variable "cfs_tags" {
  type    = map(string)
  default = {}
  description = "cfs tags"
}

variable "storage_type" {
  type = string
  default = "SD"
  description = " ForceNew. Storage type of the file system. Valid values: SD (Standard), HP (High-Performance), TB (Standard Turbo), and TP (High-Performance Turbo). Default value: SD."
}

variable "capacity" {
  type = number
  default = null
  description = " File system capacity, in GiB (required for the Turbo series). For Standard Turbo, the minimum purchase required is 40,960 GiB (40 TiB) and the expansion increment is 20,480 GiB (20 TiB). For High-Performance Turbo, the minimum purchase required is 20,480 GiB (20 TiB) and the expansion increment is 10,240 GiB (10 TiB)."
}

variable "net_interface" {
  type = string
  default = "VPC"
  description = " Network type, Default VPC. Valid values: VPC and CCN. Select VPC for a Standard or High-Performance file system, and CCN for a Standard Turbo or High-Performance Turbo one."
}

variable "ccn_id" {
  type = string
  default = null
  description = " CCN instance ID (required if the network type is CCN)."
}

variable "cidr_block" {
  type = string
  default = null
  description = "CCN IP range used by the CFS (required if the network type is CCN), which cannot conflict with other IP ranges bound in CCN."
}

variable "mount_ip" {
  type = string
  default = null
  description = "ForceNew. IP of mount point."
}