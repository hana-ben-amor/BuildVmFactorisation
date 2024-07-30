//iso_url download link : https://access.cdn.redhat.com/content/origin/files/sha256/39/398561d7b66f1a4bf23664f4aa8f2cfbb3641aa2f01a320068e86bd1fc0e9076/rhel-9.4-x86_64-dvd.iso?_auth_=1722161092_6bdc3a2a0b853f7848ce38ead6e047dd
iso_url="file:///C:/Users/hanab/Desktop/Stage Vermeg/RedHat/rhel-9.4-x86_64-dvd.iso"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
vm_name="RHEL-9.4"
home=""
virtualbox_guest_os_type="RedHat_64"
version              = "0.1"
update               = "true"
ssh_username         = "rhel"
ssh_password         = "rhelpassword"
ssh_fullname         = "rhel"
iso_checksum="398561d7b66f1a4bf23664f4aa8f2cfbb3641aa2f01a320068e86bd1fc0e9076"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-rhel8"
boot_command = [
      "<esc><wait>",
      // "vmlinuz initrd=initrd.img inst.geoloc=0 rd.driver.blacklist=dm-multipath net.ifnames=0 biosdevname=0 ",
      "vmlinuz initrd=initrd.img inst.ks=http://172.20.10.2:{{.HTTPPort}}/ks.cfg",
      "<enter>"
]
