variable "cpus" {}
variable "disk_size" {}
variable "headless" {}
variable "hostname" {}
variable "http_proxy" {}
variable "https_proxy" {}
variable "iso_checksum" {}
variable "iso_checksum_type" {}
variable "iso_url" {}
variable "memory" {}
variable "no_proxy" {}
variable "ssh_fullname" {}
variable "ssh_password" {}
variable "ssh_username" {}
variable "update" {}
variable "version" {}
variable "virtualbox_guest_os_type" {}
variable "vm_name" {}
variable "home" {}
variable "vram"{}
variable output_directory{}
variable ol7_iso_checksum{}
variable ol7_iso_url{}
variable ol8_iso_checksum{}
variable ol8_iso_url{}

source "virtualbox-iso" "vm" {
 
  boot_command= [
        "<esc><wait>",
        "vmlinuz initrd=initrd.img inst.ks=http://172.20.10.2:{{ .HTTPPort }}/ks.cfg",
        "<enter>"
  ]      
  disk_size               = "${var.disk_size}"
  guest_os_type           = "${var.virtualbox_guest_os_type}"
  hard_drive_interface    = "sata"
  headless                = "${var.headless}"
  http_directory          = "./http"
  iso_checksum            = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls                = [
    "${var.iso_url}"
  ]
  output_directory        = "${var.output_directory}" 
  shutdown_command        = "echo '${var.ssh_password}'|sudo -S shutdown -P now" 
  ssh_username            = "${var.ssh_username}"
  ssh_password            = "${var.ssh_password}"
  ssh_wait_timeout        = "10000s"
  guest_additions_mode    = "disable"
  vboxmanage             = [
    ["modifyvm", "{{ .Name }}", "--audio", "none"], 
    ["modifyvm", "{{ .Name }}", "--usb", "off"],
    ["modifyvm", "{{ .Name }}", "--vram", "${var.vram}"], 
    ["modifyvm", "{{ .Name }}", "--vrde", "off"], 
    ["modifyvm", "{{.Name}}", "--nic1", "bridged"],
    ["modifyvm", "{{.Name}}", "--bridgeadapter1","Intel(R) Wi-Fi 6E AX211 160MHz"],
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"], 
    ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"],
    // ["modifyvm", "{{ .Name }}", "--natpf1", "guestssh,tcp,,2236,,22"]
  ]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "${var.vm_name}"
  format                  = "ova"
}





build {
  sources = ["source.virtualbox-iso.oracle9"]
  
  provisioner "file" {
  source      = ".ssh/id_ed25519.pub"
  destination = "/tmp/id_ed25519.pub"
}

provisioner "shell" {
  inline = [
    "mkdir -p /home/packer/.ssh",
    "cat /tmp/id_ed25519.pub >> /home/packer/.ssh/authorized_keys",
    "chmod 600 /home/packer/.ssh/authorized_keys",
    "chown packer:packer /home/packer/.ssh /home/packer/.ssh/authorized_keys",
    "rm /tmp/id_ed25519.pub"
  ]
}  
}
