packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
    ansible = {
      version = "v1.0.3"
      source  = "github.com/hashicorp/ansible"
      
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
    playbook_file = "roles.yml"
    user = "root"
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "ANSIBLE_SSH_ARGS='-o ForwardAgent=yes -o ControlMaster=auto -o ControlPersist=60s'",
      "ANSIBLE_NOCOLOR=True",
      "ANSIBLE_CONNECTION=docker",
      "ANSIBLE_REMOTE_USER=root"
    ]
    }
}

