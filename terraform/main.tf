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

  context = {
    NETWORK        = "YES"
    SSH_PUBLIC_KEY = file("~/.ssh/id_rsa.pub")
  }
}

output "vm_ip" {
  value = opennebula_virtual_machine.vm.nic[0].ip
}
