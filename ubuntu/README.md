Playbook created to deploy Ubuntu vms for lab purpose 


1) Create the template
Download the ubuntu 20 or 22 for template configuration

inside of the util directory there are some files to help with: 

* netlab1.xml: to configure the invernal libvirt network, virsh net-import netlab1.xml.
* virt_install.sh: the script to run and prepare the template vm, this step is interactive with the terminal to configure everything. e.g: name, ip, hostname...


2) Setting the variables 

Inside of inventory/host_vars/localhost.yml you must to setup some variables: 


img_template: the template image name without extension
template_address: the ip address set to the interface

for vm section you must inform ram, vcpu and net_type for networking selection(bridge or virtual network), and net_connector is the network name for virtual network or the bridge name for brige. 

```
img_template: "ubuntu20.04"
template_address: "192.168.200.10"
osvariant: ubuntu20.04
vm:
  - name: repo
    cpu: 1
    mem: 2048
    net_type: "network"
    net_connector: "netlab1"
    net:
      ip: 192.168.200.150
      mask: 255.255.255.0
      gateway: 192.168.200.1
      dns: 192.168.200.1
```


3) Deploying the vms

run the playbook 

```
ansible-playbook -i inventory/hosts ubuntu_vms.yml
```

you can destroy the vms with : 

```
ansible-playbook -i inventory/hosts destroy.yml
```
