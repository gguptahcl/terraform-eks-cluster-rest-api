#
# Variables Configuration
#

# VPC Variable Start

variable "vpc_name" {
	default = "demo"
	#default="Sample4000_VPC"
}

variable "vpc_cidr" {
	default = "10.0.0.0/16"
}

variable "vpc_subnet_count" {
	default = "2"
}

variable "vpc_subnet_cidr_block" {
	default = ["10.0.0.0/24" , "10.0.1.0/24" , "10.0.2.0/24"]
}


variable "vpc_name_tag"  {
	default="Sample4000-demo-node"
}

variable "vpc_internet_gateway_name_tag"  {
	default="Sample4000-demo"
}

# VPC variables End

variable "cluster-name" {
  default="Sample4000"	
  type    = "string"
}

variable "eks-cluster-iam-role-name" { 
    default="Sample4000-demo-cluster"
}

variable "eks-cluster-aws-security-group-name" { 
	default="Sample4000-demo-cluster"
}

variable "eks-cluster-aws-security-group-tag-name" { 
	 default="Sample4000-demo"	
}

variable "eks-worker-node-iam-role-name" { 
 default="Sample4000-demo"
}

variable "aws_iam_instance_profile-name" { 
 default="Sample4000-demo"
}


variable "aws_security_group-name" { 
 default="Sample4000-demo-node"
}

variable "aws_launch_configuration_name_prefix" {
    default="Sample4000-demo"	
}


variable "aws_autoscaling_group_name" {
	default="Sample4000-demo"
}

