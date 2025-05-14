module "talos" {
  source           = "./Talos-Cluster"
  cluster_name     = "Homelab"
  cluster_endpoint = "https://172.17.2.111:6443"
  tailscale_token  = var.tailscale_token_talos
}

module "helm" {
  source = "./Helm-Deployments"
  depends_on = [ module.talos ]
  cluster_endpoint = module.talos.cluster_endpoint
}
