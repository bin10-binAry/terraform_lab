variable "tf_vpc_name" {
    default = "Assignment_TF_lab_from_var"
    description = "For IAC learning"
}
variable "tf_vpc_cidr" {
    default = "10.10.0.0/16"
}

variable "tf_zone_ava_name" {
    type = list(string)
    default = [ "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c" ]
}

variable "tf_lab_pub_rtb" {
    default = "TF_Public_RTB_by_var"
}

variable "tf_lab_pv_rtb" {
    default = "TF_Private_RTB_by_var"
}

variable "tf_zone_cidr_pv" {
    type = list(string)
    default = [ "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24" ]
}

variable "tf_zone_cidr_pb" {
    type = list(string)
    default = [ "10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24" ]
}

variable "tf_zone_name_pv" {
    type = list(string)
    default = [ "pv-1", "pv-2", "pv-3" ]
}

variable "tf_zone_name_pb" {
    type = list(string)
    default = [ "pb-1", "pb-2", "pb-3" ]
}