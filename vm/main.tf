resource "digitalocean_ssh_key" "default" {
  name       = "do-mdm-key"
  public_key = file("/home/aureliano/.ssh/id_rsa_do.pub")
}

resource "digitalocean_droplet" "vm" {
  image  = var.image
  name   = var.name
  region = "ams3"
  size   = var.size
  user_data     = file("${var.init_script}")
  ssh_keys = [digitalocean_ssh_key.default.fingerprint] 
}