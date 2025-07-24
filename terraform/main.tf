terraform {
  required_providers {
    opennebula = {
      source  = "OpenNebula/opennebula"
      version = "1.0.1"  # Or the latest supported version
    }
  }
}

provider "opennebula" {
  endpoint = var.endpoint
  username = var.username
  password = var.password
}

resource "opennebula_virtual_machine" "vm" {
  name        = "test-vm"
  cpu         = 1
  vcpu        = 1
  memory      = 512
  image_id    = var.image_id
  template_id = var.template_id

  extra_template = <<EOF
CONTEXT=[
  NETWORK="YES",
  SSH_PUBLIC_KEY="${file("~/.ssh/id_rsa.pub")}"
]
EOF
}

output "vm_ip" {
  value = opennebula_virtual_machine.vm.nic[0].ip
}
