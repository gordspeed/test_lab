cpus = "1"
disk_size = "8096"
headless = "true"
hostname = "ubuntu"
#http_proxy = "${env("http_proxy")}"
#https_proxy = "${env("https_proxy")}"
iso_checksum = "10f19c5b2b8d6db711582e0e27f5116296c34fe4b313ba45f9b201a5007056cb"
iso_checksum_type = "sha256"
iso_name = "ubuntu-22.04.1-live-server-amd64.iso"
iso_path = "iso"
iso_url = "file:/home/jenkins/iso/ubuntu-22.04.1-live-server-amd64.iso"
memory = "2048"
#no_proxy = "${env("no_proxy")}"
preseed = "preseed.cfg"
ssh_fullname = "ansible"
ssh_password = "ansible"
ssh_username = "ansible"
update = "true"
version = "0.1"
virtualbox_guest_os_type = "Ubuntu_64"
vm_name = "ubuntu"
#home = env("HOME")