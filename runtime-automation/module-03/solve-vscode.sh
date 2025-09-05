#!/bin/bash

su - $USER -c 'cat >/tmp/setup-scripts/solve_challenege_3.yml << EOF
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
EOF
cat /tmp/setup-scripts/solve_challenege_3.yml'
su - rhel -c 'ansible-navigator run /tmp/setup-scripts/solve_challenege_3.yml --mode stdout'
