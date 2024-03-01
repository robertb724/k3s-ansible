resource "helm_release" "loki" {
  name             = "loki"
  repository       = "https://grafana.github.io/helm-charts"
  namespace        = "loki"
  chart            = "loki"
  create_namespace = true
#   version          = "56.8.0"
  values = [
    file("${path.module}/values/loki.values.yaml")
  ]
}

resource "helm_release" "promtail" {
  name             = "promtail"
  repository       = "https://grafana.github.io/helm-charts"
  namespace        = "loki"
  chart            = "promtail"
  create_namespace = false
  version          = "6.15.5"
  values = [
    file("${path.module}/values/promtail.values.yaml")
  ]

}