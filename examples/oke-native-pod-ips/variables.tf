## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "tenancy_id" {}
variable "user_ocid" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
variable "fingerprint" {}
variable "vcn_ocid" {}
variable "my_api_endpoint_subnet_ocid" {}
variable "my_pods_nodepool_subnet_ocid" {}
variable "pods_subnet_ocid" {}
variable "kms_key_id" {}
variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to all resources."
  type        = string
}
variable "min_number_of_nodes" {}
variable "max_number_of_nodes" {}

variable "node_pools" {
  default     = {}
  description = "Tuple of node pools. Each key maps to a node pool. Each value is a tuple of shape (string),ocpus(number) , node_pool_size(number) and boot_volume_size(number)"
  type        = any
}


variable "token" {
}

variable "oke_cluster_name" {
  default = "Test_OKE_Tags_up"
}

variable "k8s_version" {
  #default = "v1.24.1"
  default = "v1.25.4"
}
variable "node_image_id" {
  #default = "ocid1.image.oc1.phx.aaaaaaaafhnymeqt5q3437wiuckekjodt3funyfz6hxuanchpfoqzq6nhxrq"
  default = "ocid1.image.oc1.phx.aaaaaaaas3s5ziwx2mvrrz6juwzqfck7u4m2sfgsiijp6qxh6ni4vasu5peq"
}

variable "pool_name" {
  default = "Test_Multi_Node_Pool"
}

variable "node_shape" {
  default = "VM.Standard.E4.Flex"
}

variable "node_ocpus" {
  default = 4
}

variable "node_memory" {
  default = 8
}

variable "node_count" {
  default = 1
}

variable "node_linux_version" {
  default = "7.9"
}

variable "instance_os" {
  default = "Oracle Linux"
}

variable "ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute nodepool"
  type        = string

}
variable "ignore_label_prefix_in_node_pool_names" {
  default     = false
  description = "While using label_prefix to add a prefix to many OCI resource names, do not use the label_prefix when naming each node pool. This frees up more characters for the nodepool name. Current limit to node pool name is 32 characters."
  type        = bool
}


#freeform-tags[oke cluster]
#Key
variable "cluster_role_key" {}
variable "cluster_name_key" {}
variable "cluster_env_key" {}

#value
variable "cluster_name_value" {}
variable "cluster_role_value" {}
variable "cluster_env_value" {}

#upgrade-k8s
#check worker node active
variable "check_node_active" {
  type = string
}

# upgrade
variable "upgrade_nodepool" {
  type = bool
}

variable "nodepool_upgrade_method" {
  type = string
}

variable "node_pools_to_drain" {
  type = list(string)
}

#variable "cluster_id" {}



# service account
variable "create_service_account" {
  type = bool
}

variable "service_account_name" {}

variable "service_account_namespace" {}

variable "service_account_cluster_role_binding" {}





#variable "service_subnet_ocid" {}
#variable "my_lb_subnet_ocid" {}

