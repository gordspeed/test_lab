packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:xenial"
  commit = true
}


build {
  sources = ["source.docker.ubuntu"]

provisioner "ansible" {
    playbook_file   = "./roles.yml"
      }
}