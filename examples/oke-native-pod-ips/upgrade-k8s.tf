module "upgrade-k8s" {
  source                               = "../../upgrade-k8s"
  tenancy_ocid                         = var.tenancy_ocid
  compartment_ocid                     = var.compartment_ocid
  label_prefix                         = var.label_prefix
  region                               = var.region
  cluster_id                           = module.oci-oke.cluster.id
  oke_cluster_name                     = var.oke_cluster_name
  create_service_account               = var.create_service_account
  service_account_name                 = var.service_account_name
  service_account_namespace            = var.service_account_namespace
  service_account_cluster_role_binding = var.service_account_cluster_role_binding
  #check worker nodes are active
  check_node_active = var.check_node_active

  # oke upgrade
  upgrade_nodepool        = var.upgrade_nodepool
  nodepool_upgrade_method = var.nodepool_upgrade_method
  node_pools_to_drain     = var.node_pools_to_drain
  depends_on = [
    module.oci-oke
  ]
}




#kubernetes_version  = module.oci-oke.cluster.kubernetes_version
#node_pool1_version  = module.oci-oke.node_pool1.kubernetes_version
#node_pool2_version  = module.oci-oke.node_pool2.kubernetes_version
#node_pool3_version  = module.oci-oke.node_pool3.kubernetes_version
#cluster_id          = module.oci-oke.cluster.id
#node_pool1_id       = module.oci-oke.node_pool1.id
#node_pool2_id       = module.oci-oke.node_pool2.id
#node_pool3_id       = module.oci-oke.node_pool3.id
#region              = var.region
#compartment_ocid    = var.compartment_ocid
#tenancy_ocid        = var.tenancy_ocid
#max_number_of_nodes = var.max_number_of_nodes
#min_number_of_nodes = var.min_number_of_nodes

