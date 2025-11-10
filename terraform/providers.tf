terraform {
    required_providers {
        libvirt = {
            source  = "dmacvicar/libvirt"
            version = "~> 0.7.0"
        }
    }
    required_version = ">= 1.5.0"
}

