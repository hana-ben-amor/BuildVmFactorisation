iso_url              = "file:///C:/Users/hanab/Downloads/OracleLinux-R8-U10-x86_64-dvd.iso"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
vm_name              = "oracle-linux-8.10-2"
home                 = ""
virtualbox_guest_os_type = "Oracle_64"
version              = "0.1"
update               = "true"
ssh_username         = "oracle"
ssh_password         = "oraclepassword"
ssh_fullname         = "oracle"
iso_checksum         = "7676a80eeaafa16903eebb2abba147a3afe230b130cc066d56fdd6854d8da900"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-ol8"
boot_command = [
  "<esc><wait>",
  "vmlinuz initrd=initrd.img inst.ks=http://172.20.10.2:{{ .HTTPPort }}/ks.cfg",
  "<enter>"
]
