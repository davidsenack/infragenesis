provider "libvirt" {
    uri - "qemu:///system"
}

resource "libvirt_volume" "ubuntu_img" {
    name = "ubuntu_base"
    source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

resource "libvirt_domain" "infra_nodes" {
    count   = 3
    name    = "infra-node-${count.index}"
    memory  = 2048
    vcpu    = 2
    network_interface {
        network_name = "default"
    }
    disk {
        volume_id = libvirt_volume.ubuntu_image.id
    }
    cloudinit = data.template_cloudinit_config.config.rendered
}
