
locals {
  live_workspace = "live-1"
  live_domain    = "cloud-platform.service.justice.gov.uk"

  alertmanager_ingress = terraform.workspace == local.live_workspace ? format("%s.%s", "https://alertmanager", local.live_domain) : format(
    "%s.%s",
    "https://alertmanager.apps",
    data.terraform_remote_state.cluster.outputs.cluster_domain_name,
  )
  grafana_ingress = terraform.workspace == local.live_workspace ? format("%s.%s", "grafana", local.live_domain) : format(
    "%s.%s",
    "grafana.apps",
    data.terraform_remote_state.cluster.outputs.cluster_domain_name,
  )
  grafana_root = terraform.workspace == local.live_workspace ? format("%s.%s", "https://grafana", local.live_domain) : format(
    "%s.%s",
    "https://grafana.apps",
    data.terraform_remote_state.cluster.outputs.cluster_domain_name,
  )
  prometheus_ingress = terraform.workspace == local.live_workspace ? format("%s.%s", "https://prometheus", local.live_domain) : format(
    "%s.%s",
    "https://prometheus.apps",
    data.terraform_remote_state.cluster.outputs.cluster_domain_name,
  )
}