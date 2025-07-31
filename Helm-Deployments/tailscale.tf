resource "helm_release" "tailscale-operator" {
  name              = "tailscale-operator"
  repository        = "https://pkgs.tailscale.com/helmcharts"
  chart             = "tailscale-operator"
  version           = "1.86.2"
  dependency_update = true
  create_namespace  = true
  namespace         = "tailscale"
  wait              = true
  set_sensitive = [
    {
      name  = "oauth.clientId"
      value = var.tailscale_operator_id
    },
    {
      name  = "oauth.clientSecret"
      value = var.tailscale_operator_token
    }
  ]
}
