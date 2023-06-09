## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "cluster" {
  value = {
    id                 = oci_containerengine_cluster.oci_oke_cluster.id
    kubernetes_version = oci_containerengine_cluster.oci_oke_cluster.kubernetes_version
    name               = oci_containerengine_cluster.oci_oke_cluster.name
  }
}

output "node_pool1" {
  value = {
    id                 = oci_containerengine_node_pool.oci_oke_node_pool["np1"].id
    kubernetes_version = oci_containerengine_node_pool.oci_oke_node_pool["np1"].kubernetes_version
    name               = oci_containerengine_node_pool.oci_oke_node_pool["np1"].name
  }
}

output "node_pool2" {
  value = {
    id                 = oci_containerengine_node_pool.oci_oke_node_pool["np2"].id
    kubernetes_version = oci_containerengine_node_pool.oci_oke_node_pool["np2"].kubernetes_version
    name               = oci_containerengine_node_pool.oci_oke_node_pool["np2"].name
  }
}

output "node_pool3" {
  value = {
    id                 = oci_containerengine_node_pool.oci_oke_node_pool["np3"].id
    kubernetes_version = oci_containerengine_node_pool.oci_oke_node_pool["np3"].kubernetes_version
    name               = oci_containerengine_node_pool.oci_oke_node_pool["np3"].name
  }
}


#output "node_details" {
#  value = zipmap(module.oci_containerengine_node_pool.oci_oke_node_pool["np1"].id,oci_containerengine_node_pool.oci_oke_node_pool["np1"].name)
#}

output "nodepool_ids" {
  value = zipmap(values(oci_containerengine_node_pool.oci_oke_node_pool)[*].name, values(oci_containerengine_node_pool.oci_oke_node_pool)[*].id)
}

output "endpoints" {
  value = oci_containerengine_cluster.oci_oke_cluster.endpoints
}

output "chosen_node_shape_and_image" {
  value = {
    image_id    = element([for source in data.oci_containerengine_node_pool_option.oci_oke_node_pool_option.sources : source.image_id if length(regexall("Oracle-Linux-${var.node_linux_version}-20[0-9]*.*", source.source_name)) > 0], 0)
    source_name = element([for source in data.oci_containerengine_node_pool_option.oci_oke_node_pool_option.sources : source.source_name if length(regexall("Oracle-Linux-${var.node_linux_version}-20[0-9]*.*", source.source_name)) > 0], 0)
  }
}

output "KubeConfig" {
  value = data.oci_containerengine_cluster_kube_config.KubeConfig.content
}


