
# Create a new SSH key
resource "digitalocean_ssh_key" "moud-sshkey" {
  name       = "moud-sshkey"
  public_key = file("ssh_keys/moud-ssh.pub")
}

resource "digitalocean_droplet" "octa-dockerapps" {
    image = "ubuntu-22-04-x64"
    name = "server-apps"
    region = "nyc1"
    size = "s-1vcpu-2gb"
    ssh_keys = [digitalocean_ssh_key.moud-sshkey.fingerprint]
  
}

resource "digitalocean_floating_ip" "octa-flotting-ip" {
    region = digitalocean_droplet.octa-dockerapps.region
    droplet_id = digitalocean_droplet.octa-dockerapps.id

}


