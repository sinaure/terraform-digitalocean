terraform {
  backend "s3" {
    endpoint                    = "ams3.digitaloceanspaces.com/" # specify the correct DO region
    region                      = "us-west-1" # not used since it's a DigitalOcean spaces bucket
    key                         = "terraform.tfstate"
    bucket                      = "ynovcampus" # The name of your Spaces

    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = "ynov-cluster"
  region  = "ams3"
  version = "1.28.2-do.0"

  tags = ["ynov"]

  # This default node pool is mandatory
  node_pool {
    name       = "default-pool"
    size       = "s-1vcpu-2gb" # minimum size, list available options with `doctl compute size list`
    auto_scale = false
    node_count = 2
    tags       = ["default"]
  }

}

resource "digitalocean_kubernetes_node_pool" "app_node_pool" {
  cluster_id = digitalocean_kubernetes_cluster.kubernetes_cluster.id

  name = "app-pool"
  size = "s-2vcpu-4gb" # bigger instances
  tags = ["applications"]

  # you can setup autoscaling
  auto_scale = true
  min_nodes  = 2
  max_nodes  = 5
  labels = {
    service  = "apps"
    priority = "high"
  }
}