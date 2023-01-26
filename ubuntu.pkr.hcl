

source "virtualbox-iso" "ubuntu" {
  boot_command            = [
        " <wait><enter><wait>",
        "<f6><esc>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
        "<bs><bs><bs>",
        "/casper/vmlinuz ",
        "initrd=/casper/initrd ",
        "autoinstall ",
        "ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu-20.04/ ",
        "<enter>"
  ]
  disk_size               = "${var.disk_size}"
  guest_os_type           = "${var.virtualbox_guest_os_type}"
  hard_drive_interface    = "sata"
  headless                = "${var.headless}"
  http_directory          = "http"
  iso_checksum            = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls                = [
    "${var.iso_path}/${var.iso_name}", 
    "${var.iso_url}"
  ]
  output_directory        = "output"
  shutdown_command        = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
  ssh_username            = "${var.ssh_username}"
  ssh_password            = "${var.ssh_password}"
  ssh_wait_timeout        = "10000s"
  guest_additions_mode    = "disable"
  vboxmanage              = [
    ["modifyvm", "{{ .Name }}", "--audio", "none"], 
    ["modifyvm", "{{ .Name }}", "--usb", "off"], 
    ["modifyvm", "{{ .Name }}", "--vram", "12"], 
    ["modifyvm", "{{ .Name }}", "--vrde", "off"], 
    ["modifyvm", "{{ .Name }}", "--nictype1", "virtio"], 
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"], 
    ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "${var.vm_name}"
  format                  = "ova"
}



build {
  sources = ["source.virtualbox-iso.ubuntu"]
  
  //provisioner "file" {
  //  source      = "${var.home}/.ssh/id_ed25519.pub"
  //  destination = "/home/ubuntu/authorized_keys"
  //}

  //provisioner "shell" {
  //  environment_vars  = [
  //    "DEBIAN_FRONTEND=noninteractive", 
  //    "UPDATE=${var.update}", 
  //    "SSH_USERNAME=${var.ssh_username}", 
  //    "SSH_PASSWORD=${var.ssh_password}", 
  //    "http_proxy=${var.http_proxy}", 
  //    "https_proxy=${var.https_proxy}", 
  //   "no_proxy=${var.no_proxy}"
  //  ]
  //  execute_command   = "echo '${var.ssh_password}'|{{ .Vars }} sudo -E -S bash '{{ .Path }}'"
  //  expect_disconnect = true
  //  scripts           = [
  //    "script/update.sh", 
  //    "script/cleanup.sh",
  //    "script/ssh.sh"
  //  ]
  }

//}