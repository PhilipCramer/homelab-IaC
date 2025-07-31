module "talos" {
  source           = "./Talos-Cluster"
  cluster_name     = "Homelab"
  cluster_endpoint = "https://172.17.2.111:6443"
  ts_key           = var.tailscale_key_talos
}

module "helm" {
  depends_on               = [module.talos]
  source                   = "./Helm-Deployments"
  cluster_endpoint         = module.talos.cluster_endpoint
  tailscale_operator_id    = var.tailscale_operator_id
  tailscale_operator_token = var.tailscale_operator_token
}
