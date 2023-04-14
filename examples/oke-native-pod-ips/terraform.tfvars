user_ocid        = ""
tenancy_ocid     = ""
tenancy_id       = ""
compartment_ocid = ""
fingerprint      = ""
private_key_path = ""
region           = "us-phoenix-1"
kms_key_id       = ""
ssh_public_key = ""
label_prefix   = "dev"

#private-vcn-networks
vcn_ocid                     = ""
my_api_endpoint_subnet_ocid  = ""
my_pods_nodepool_subnet_ocid = ""
pods_subnet_ocid             = ""

max_number_of_nodes = "3"
min_number_of_nodes = "2"

node_pools = {
  # Basic node pool
  np1 = {
    shape                   = "VM.Standard.E4.Flex",
    ocpus                   = 4,
    memory                  = 8,
    node_pool_size          = 1,
    boot_volume_size        = 150,
    eviction_grace_duration = 0, //Grade duration in minutes. Service default is 60.
    force_node_delete       = true
  }
  # node pool with initial node labels
  np2 = {
    shape            = "VM.Standard.E4.Flex",
    ocpus            = 4,
    memory           = 10,
    node_pool_size   = 1,
    boot_volume_size = 150,
    label            = { app = "frontend", pool = "np2" },
  }
  # node pool with freeform tags
  np3 = {
    shape                  = "VM.Standard.E4.Flex",
    ocpus                  = 5,
    memory                 = 12,
    node_pool_size         = 1,
    boot_volume_size       = 150,
    nodepool_freeform_tags = { app = "frontend", pool = "np2" },
    node_freeform_tags     = { app = "frontend", nodes = "np2" },
  }
  np4 = {
    shape                   = "VM.Standard.E4.Flex",
    ocpus                   = 4,
    memory                  = 8,
    node_pool_size          = 1,
    boot_volume_size        = 150,
    eviction_grace_duration = 0, //Grade duration in minutes. Service default is 60.
    force_node_delete       = true
  }
  # node pool with initial node labels
  np5 = {
    shape            = "VM.Standard.E4.Flex",
    ocpus            = 4,
    memory           = 10,
    node_pool_size   = 1,
    boot_volume_size = 150,
    label            = { app = "frontend", pool = "np2" },
  }
  # node pool with freeform tags
  np6 = {
    shape                  = "VM.Standard.E4.Flex",
    ocpus                  = 5,
    memory                 = 12,
    node_pool_size         = 1,
    boot_volume_size       = 150,
    nodepool_freeform_tags = { app = "frontend", pool = "np2" },
    node_freeform_tags     = { app = "frontend", nodes = "np2" },
  }
}

cluster_name_key   = "cluster-name"
cluster_name_value = "dev-test"
cluster_role_key   = "role"
cluster_role_value = "control-plane"
cluster_env_key    = "cluster-environment"
cluster_env_value  = "dev"

check_node_active = "all"
# upgrade of existing node pools
upgrade_nodepool        = false
node_pools_to_drain     = ["np1", "np2", "np3"]
nodepool_upgrade_method = "out_of_place"

# service account
create_service_account               = false
service_account_name                 = ""
service_account_namespace            = ""
service_account_cluster_role_binding = ""

#debug_mode = false
