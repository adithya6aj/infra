output "vm_ip" {
  value = opennebula_virtual_machine.vm.nic[0].ip
}
