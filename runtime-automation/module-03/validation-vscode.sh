#!/bin/bash

tee /home/rhel/check_challenege_3.yml << EOF
---
- name: configure SNMP
  hosts: cisco
  gather_facts: false

  tasks:

    - name: use snmp resource module
      cisco.ios.snmp_server:
        state: merged          
        config:            
          location: 'Durham'
          packet_size: 500
          communities:
            - acl_v4: acl_uq
              name: Durham-community
              rw: true
            - acl_v4: acl_uq
              name: ChapelHill-community
              rw: true
      register: snmpstatus

    - name: run commnad to tell instruqt what to do
      ansible.builtin.fail:
        msg: "SNMP configuration was not applied - please try again or use SKIP"
      when: snmpstatus.changed == True
EOF

sudo chown rhel:rhel /home/rhel/check_challenege_3.yml

su - rhel -c 'ansible-navigator run /home/rhel/check_challenege_3.yml --mode stdout'

if [ $? -eq 0 ]; then
    echo OK
else
    echo "SNMP configuration was not applied - please try again or use SKIP"
fi